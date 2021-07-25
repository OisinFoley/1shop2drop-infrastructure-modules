output "container_registry_name" {
  value = azurerm_container_registry.this.name
}

output "container_registry_password" {
  value = azurerm_container_registry.this.admin_password
}