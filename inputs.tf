variable "tenant-name" {
  type = string
}

variable "tenant-short-name" {
  type = string
}

variable "location" {
  type    = string
  default = "switzerlandnorth"
}

variable "name" {
  type = string
}

variable "hub-vnet" {
  type = object({
    name                = string
    resource-group-name = string
    id                  = string
  })
}

variable "firewall-ip" {
  type = string
}

variable "vnet-address-space" {
  type = list(string)
}

variable "subnets" {
  type = list(object({
    name          = string
    address-space = string
  }))
  default = null
  nullable = true
}

variable "dns-servers" {
  type = list(string)
  default = null
}
