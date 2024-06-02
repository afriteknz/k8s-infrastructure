output "kube_config" {
  value     = data.azurerm_kubernetes_cluster.k8s.kube_config
  sensitive = true
}

