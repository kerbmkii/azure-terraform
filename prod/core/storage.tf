resource "azurerm_storage_account" "cloud_storage" {
  name                     = "nkcloudstorage"
  resource_group_name      = azurerm_resource_group.core.name
  location                 = azurerm_resource_group.core.location
  access_tier              = "Hot"
  account_kind             = "FileStorage"
  account_tier             = "Premium"
  account_replication_type = "LRS"

  network_rules {
    default_action = "Deny"
    ip_rules       = ["61.245.133.84"]
    bypass         = ["AzureServices"]
  }
}
