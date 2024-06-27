locals {
  infra_rg_name                 = "k8s-rg"
  infra_nodes_rg_name           = "k8s-nodes-rg"
  infra_kubernetes_cluster_name = "cluster-cubem"
}

data "azurerm_kubernetes_cluster" "k8s" {
  name                = var.kubernetes_cluster_name
  resource_group_name = local.infra_rg_name
}

provider "kubernetes" {
  host                   = data.azurerm_kubernetes_cluster.k8s.kube_config.0.host
  username               = data.azurerm_kubernetes_cluster.k8s.kube_config.0.username
  password               = data.azurerm_kubernetes_cluster.k8s.kube_config.0.password
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.k8s.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.k8s.kube_config.0.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

locals {
  argocd_resources_labels = {
    "app.kubernetes.io/instance"  = "argocd"
    "argocd.argoproj.io/instance" = "argocd"
  }

  argocd_resources_annotations = {
    "argocd.argoproj.io/compare-options" = "IgnoreExtraneous"
    "argocd.argoproj.io/sync-options"    = "Prune=false,Delete=false"
  }
}

# Declare some resources, and the git-ops tool:
resource "kubernetes_namespace" "argocd" {
  depends_on = [data.azurerm_kubernetes_cluster.k8s]

  metadata {
    name = "argocd"
  }
}

# Auth to fetch git-ops code
resource "kubernetes_secret" "argocd_repo_credentials" {
  depends_on = [kubernetes_namespace.argocd]
  metadata {
    name      = "argocd-repo-credentials"
    namespace = "argocd"
    labels = merge(local.argocd_resources_labels, {
      "argocd.argoproj.io/secret-type" = "repo-creds"
    })
    annotations = local.argocd_resources_annotations
  }
  type = "Opaque"
  data = {
    url           = "git@github.com/afriteknz/k8s-manifests.git"
    sshPrivateKey = file("./values/id_rsa")
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = kubernetes_namespace.argocd.id
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "6.7.11"
  skip_crds  = true
  depends_on = [
    kubernetes_secret.argocd_repo_credentials,
  ]
  values = [file("./values/argocd.yaml")]
}

# The bootstrap application
resource "kubectl_manifest" "argocd_bootstrap" {
  depends_on = [helm_release.argocd]

  yaml_body = yamlencode({
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"

    metadata = {
      name      = "bootstrap-${var.kubernetes_cluster_name}"
      namespace = "argocd"
    }

    spec = {
      project = "flask-apps"
      destination = {
        namespace = "default"
        server    = "https://kubernetes.default.svc" # In-cluster API server URL
      }
      source = {
        repoURL = "git@github.com:afriteknz/k8s-manifests.git"
        path : "flask-app-v3-mfs"
        revision : "HEAD"
      }
      syncPolicy = {
        automated = {
          prune    = true
          selfHeal = true
        }
      }
    }
  })
}
