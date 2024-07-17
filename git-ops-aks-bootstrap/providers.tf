provider "azurerm" {
  features {}
}

terraform {
  required_version = ">= 1.0"

  required_providers {
    # kubectl = {
    #   source  = "gavinbunney/kubectl"
    #   version = ">= 1.7.0"
    # }
    kubectl = {
      source  = "alekc/kubectl"
      version = "2.0.4"
    }
  }
}
