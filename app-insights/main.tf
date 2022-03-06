resource "azurerm_application_insights" "server" {
  name                = var.server_app_insights_name
  location            = var.resource_group_region
  resource_group_name = var.resource_group_name
  application_type    = var.application_type
}