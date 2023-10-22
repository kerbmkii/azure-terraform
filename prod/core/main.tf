resource "azurerm_resource_group" "core" {
  name     = var.resource_group
  location = var.location
}

module "virtual-network" {
  source              = "aztfm/virtual-network/azurerm"
  version             = ">=3.0.0"
  name                = "vnet-core"
  resource_group_name = azurerm_resource_group.core.name
  location            = azurerm_resource_group.core.location
  address_space       = ["10.0.0.0/16"]
  subnets = [
    { name = "core", address_prefixes = ["10.0.0.0/24"] },
    # { name = "cloud-storage", address_prefixes = ["10.1.0.0/24"], service_endpoints = ["Microsoft.Storage"] }
  ]
}
