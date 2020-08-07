provider "azurerm" {
  features {}
}

resource "random_string" "random" {
  length = 16
  special = true
  override_special = "/@£$"
}

resource "random_string" "random3" {
  length = 16
  special = true
  override_special = "/@£$"
}

output "out" {
  value = random_string.random.result
}
