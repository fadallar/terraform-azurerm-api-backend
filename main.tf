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
      authorization {
        parameter = try(each.value.authorization_parameter, null)
        scheme    = try(each.value.authorization_scheme, null)
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

  tls {
    validate_certificate_chain = var.validate_certificate_chain
    validate_certificate_name  = var.validate_certificate_name
  }

}