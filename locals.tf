locals {

  resource_id = var.resource_id != null ? join("/", [" https://management.azure.com", var.resource_id]) : null

}