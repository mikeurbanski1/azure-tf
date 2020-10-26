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

data "azurerm_subscription" "primary" {}

data "azurerm_resource_group" "tf_rg" {
  name = "tfstate"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "bcazrstorage3"
  resource_group_name      = data.azurerm_resource_group.tf_rg.name
  location                 = data.azurerm_resource_group.tf_rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "bcazr2storage2"
  resource_group_name      = data.azurerm_resource_group.tf_rg.name
  location                 = data.azurerm_resource_group.tf_rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

//resource "azurerm_storage_container" "container" {
//  name                  = "storage2"
//  storage_account_name  = azurerm_storage_account.storage_account.name
//  container_access_type = "container"
//}


# resource "azurerm_role_definition" "example" {
#     name        = "my-custom-role"
#     scope       = data.azurerm_subscription.primary.id
#     description = "This is a custom role created via Terraform"

#     permissions {
#       actions     = ["*"]
#       not_actions = []
#     }

#     assignable_scopes = ["/subscriptions/${data.azurerm_subscription.primary.id}/resourceGroup/tfstate"]

# }
