data "aws_eks_cluster_auth" "cluster" {
  name = "demo"
}

data "flux_install" "main" {
  target_path    = "clusters/demo"
  network_policy = false
  components     = ["source-controller", "helm-controller", "kustomize-controller"]
  version        = "latest"
}

data "kubectl_file_documents" "apply" {
  content = data.flux_install.main.content
}

data "flux_sync" "main" {
  target_path = "clusters/demo"
  url         = "https://github.com/chamambom/aws-fargate-terraform/tree/master/flux2cd"
  branch      = "main"
}

data "kubectl_file_documents" "sync" {
  content = data.flux_sync.main.content
}
