resource "azurerm_resource_group" "network-rg" {
  name     = var.network-rg
  location = var.location
}

resource "azurerm_resource_group" "linux-rg" {
  name     = var.linux-rg
  location = var.location
}

resource "azurerm_resource_group" "windows-rg" {
  name     = var.windows-rg
  location = var.location
}