terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01610736RG"
    storage_account_name = "tfstaten01610736sa"
    container_name       = "tfstatefiles"
    key                  = "tfstate"
  }
}