output "app_insights_instrumentation_key" {
  value = azurerm_application_insights.server.instrumentation_key
}

output "app_insights_connection_string" {
  value = azurerm_application_insights.server.connection_string
}