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

resource "azurerm_storage_share" "cloud_storage_nfs" {
  name                 = "cloud-nfs"
  storage_account_name = azurerm_storage_account.cloud_storage.name
  access_tier          = "Hot"
  enabled_protocol     = "NFS"
  quota                = 128
}
