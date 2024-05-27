# Create resource group name
resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = "k8s-rg"
}

# create acr Container registery
resource "azurerm_container_registry" "acr" {
  name                = "cubemcr"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"
  admin_enabled       = true
}

resource "azurerm_kubernetes_cluster" "k8s" {
  location            = azurerm_resource_group.rg.location
  name                = "cluster-cubem"
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "dns-cubem"

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = "agentpool"
    vm_size    = "Standard_B2s"
    node_count = var.node_count
  }
  linux_profile {
    admin_username = var.username

    ssh_key {
      # key_data = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
      key_data = azapi_resource_action.ssh_public_key_gen.output.publicKey
    }
  }
  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

  tags = {
    Environment = "Dev"
  }
}

# create role assignment for aks acr pull
resource "azurerm_role_assignment" "example" {
  principal_id                     = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}
