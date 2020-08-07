terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "bcazrtfstatestorage"
    container_name       = "tfstate"
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
  name                     = "bcazrstorage2"
  resource_group_name      = data.azurerm_resource_group.tf_rg.name
  location                 = data.azurerm_resource_group.tf_rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

# resource "random_string" "random" {
#   length = 16
#   special = true
#   override_special = "/@£$"
# }

# resource "random_string" "random2" {
#   length = 16
#   special = true
#   override_special = "/@£$"
# }

# output "out" {
#   value = random_string.random.result
# }

