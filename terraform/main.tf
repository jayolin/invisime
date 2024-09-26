provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

# Create Resource Group
resource "azurerm_resource_group" "invisime_rg" {
  name     = "invisime_rg"
  location = "UK South"
}

# Create Storage Account for Hosting App
resource "azurerm_storage_account" "invisime_storage" {
  name                     = "invisime"
  resource_group_name      = azurerm_resource_group.invisime_rg.name
  location                 = azurerm_resource_group.invisime_rg.location
  account_tier             = "Standard" # Standard or Premium
  account_replication_type = "LRS"      # Locally Redundant Storage

  static_website {
    index_document     = "index.html"
    error_404_document = "index.html"
  }
}