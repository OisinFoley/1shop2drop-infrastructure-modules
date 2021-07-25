resource "azurerm_app_service_plan" "this" {
  name                = var.server_app_service_plan_name
  location            = var.resource_group_region
  resource_group_name = var.resource_group_name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = var.server_app_service_sku_tier
    size = var.server_app_service_size
  }
}

locals {
  container_registry_hostname = "${var.container_registry_name}.azurecr.io"
}

resource "azurerm_app_service" "server" {
  name                 = var.server_app_service_name
  location             = var.resource_group_region
  resource_group_name  = var.resource_group_name
  app_service_plan_id  = azurerm_app_service_plan.this.id
  https_only           = true

  site_config {
    # must be set to true if running 'Free' tier
    use_32_bit_worker_process = var.use_32_bit_process
    always_on = true
    linux_fx_version  = "DOCKER|${local.container_registry_hostname}/${var.server_container_name}:latest"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = false
    "DOCKER_REGISTRY_SERVER_USERNAME"     = var.container_registry_name
    "DOCKER_REGISTRY_SERVER_URL"          = "https://${local.container_registry_hostname}"
    "DOCKER_REGISTRY_SERVER_PASSWORD"     = var.container_registry_password
  }
}
