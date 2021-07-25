resource "azurerm_storage_account" "default" {
  name                      = var.webapp_storage_account_name
  resource_group_name       = var.resource_group_name
  location                  = var.resource_group_region
  account_tier              = "Standard"
  # Check the below URL if higher availability and/or durability is desired.
  # https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy
  account_replication_type  = "LRS"
  access_tier               = var.storage_access_tier
  allow_blob_public_access  = var.allow_blob_public_access

  static_website {
    index_document = "index.html"
  }
}