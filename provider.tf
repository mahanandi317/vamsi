provider "azurerm" {
    features {}
}


terraform {
  backend "azurerm" {
    // resource_group_name   = var.resource_group_name_02
    // storage_account_name  = var.storage_account_02
    // container_name        = var.container_name_02
    // key                   = var.state_key_02
  }
}
