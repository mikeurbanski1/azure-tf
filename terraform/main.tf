provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg2"
  location = "Central US"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "bcazrstorage2"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
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

