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
  ARM_CLIENT_SECRET = 'QZV=A]JAMtzQ.WUQi.bwXnuedYjl3973'
  ARM_CLIENT_ID = '33764c29-a12d-44f7-8c8c-e871dab11de6'
  ARM_TENANT_ID = '513294a0-3e20-41b2-a970-6d30bf1546fa'
  ARM_SUBSCRIPTION_ID = '2c7688d7-92df-4b63-bc3f-e91ed4b6d4af'
}
