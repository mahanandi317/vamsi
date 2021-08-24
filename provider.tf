# Configure the Microsoft Azure Provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}
provider "azurerm" {
  features {}
  client_secret = "QZV=A]JAMtzQ.WUQi.bwXnuedYjl3973"
  client_id = "33764c29-a12d-44f7-8c8c-e871dab11de6"
  tenant_id = "513294a0-3e20-41b2-a970-6d30bf1546fa"
  subscription_id = "2c7688d7-92df-4b63-bc3f-e91ed4b6d4af"
}
