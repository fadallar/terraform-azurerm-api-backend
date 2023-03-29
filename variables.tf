variable "name" {
  description = "The name of the API Management backend. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The Name of the Resource Group where the API Management Service exists. Changing this forces a new resource to be created"
  type        = string
}

variable "api_management_name" {
  description = "The Name of the API Management Service where this backend should be created. Changing this forces a new resource to be created."
  type        = string
}

variable "protocol" {
  description = "The protocol used by the backend host. Possible values are http or soap."
  type        = string
  default     = "http"
}

variable "url" {
  description = "The URL of the backend host."
  type        = string
}

variable "description" {
  description = "The description of the backend."
  type        = string
  default     = null
}

variable "title" {
  description = "The title of the backend."
  type        = string
  default     = null
}

variable "resource_id" {
  description = "The management URI of the backend host in an external system. This URI can be the ARM Resource ID of Logic Apps, Function Apps or API Apps, or the management endpoint of a Service Fabric cluster."
  type        = string
  default     = null
}

variable "validate_certificate_chain" {
  description = "Flag indicating whether SSL certificate chain validation should be done when using self-signed certificates for the backend host."
  type        = string
  default     = null
}

variable "validate_certificate_name" {
  description = "Flag indicating whether SSL certificate name validation should be done when using self-signed certificates for the backend host."
  type        = string
  default     = null
}

variable "credentials_settings" {
  description = ""
  type        = map(string)
  default     = null
}

variable "proxy_settings" {
  description = ""
  type        = map(string)
  default     = null
}

variable "tls_settings" {
  description = ""
  type        = map(string)
  default     = null
}