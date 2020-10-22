terraform {
  backend "azurerm" {
    resource_group_name  = "tf2state"
    storage_account_name = "bcazr2tfstatestorage"
    container_name       = "tf2state"
  }
}

provider "azurerm" {
  version = "~>2.0"
  features {}
}

data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "tf_rg" {
  name = "tfstate"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "bcazr2storage2"
  resource_group_name      = data.azurerm_resource_group.tf_rg.name
  location                 = data.azurerm_resource_group.tf_rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_account" "storage_account2" {
  name                     = "bcazr2storage3"
  resource_group_name      = data.azurerm_resource_group.tf_rg.name
  location                 = data.azurerm_resource_group.tf_rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
