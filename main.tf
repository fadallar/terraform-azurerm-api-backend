resource "azurerm_api_management_backend" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  api_management_name = var.api_management_name
  protocol            = var.protocol
  url                 = var.url
  description         = var.description
  title               = var.title
  resource_id         = var.resource_id

  dynamic "credentials" {
    for_each = var.credentials_settings != null ? ["enabled"] : []
    content {
      dynamic "authorization" {
        for_each = each.value.authorization_scheme != null ? ["enabled"] : []
        content {
          parameter = each.value.authorization_parameter
          scheme    = each.value.authorization_scheme
        }
      }
      certificate = each.value.certificate
      header      = each.value.header
      query       = each.value.query
    }
  }

  dynamic "proxy" {
    for_each = var.proxy_settings != null ? ["enabled"] : []
    content {
      password = each.value.password
      url      = each.value.url
      username = each.value.username
    }
  }

  dynamic "tls" {
    for_each = var.tls_settings != null ? ["enabled"] : []
    content {
      validate_certificate_chain = each.value.validate_certificate_chain
      validate_certificate_name  = each.value.validate_certificate_name
    }
  }

}