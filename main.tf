resource "azurerm_api_management_backend" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  api_management_name = var.api_management_name
  protocol            = var.protocol
  url                 = var.url
  description         = var.description
  title               = var.title
  resource_id         = local.resource_id

  dynamic "credentials" {
    for_each = var.credentials_settings != null ? [var.credentials_settings] : []
    content {
      authorization {
        parameter = try(credentials.value.authorization_parameter, null)
        scheme    = try(credentials.value.authorization_scheme, null)
      }
      certificate = try(credentials.value.certificate,null)
      header      = try(credentials.value.header,null)
      query       = try(credentials.value.query,null)
    }
  }

  dynamic "proxy" {
    for_each = var.proxy_settings != null ? [var.proxy_settings] : []
    content {
      password = proxy.value.password
      url      = proxy.value.url
      username = proxy.value.username

    }
  }

  tls {
    validate_certificate_chain = var.validate_certificate_chain
    validate_certificate_name  = var.validate_certificate_name
  }

}