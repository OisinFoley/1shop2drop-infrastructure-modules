resource "azurerm_container_registry" "this" {
  name                = var.container_registry_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = var.container_registry_sku_tier
  admin_enabled       = true
}

data "azurerm_container_registry" "this" {
  name                = azurerm_container_registry.this.name
  resource_group_name = azurerm_container_registry.this.resource_group_name
}