resource "azurerm_resource_group" "cloud_storage" {
  name     = var.resource_group
  location = var.location
}
