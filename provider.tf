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
  features { }
  client_secret = "1BI7Q~8nkUxOlnvG0lXergTM.4M5h4QSDJkVH"
  client_id = "0a123ec8-46a3-4a31-9e10-1ad502657015"
  tenant_id = "eeeb6497-738c-49c7-b0cd-68cd0669e13d"
  subscription_id = "a680f040-a5db-4a85-b40f-61bf75c5aa4c"
}
