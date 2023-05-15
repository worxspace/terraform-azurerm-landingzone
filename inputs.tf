variable "location" {
  type        = string
  default     = "switzerlandnorth"
  description = "value for the location of the virtual machines"
}

variable "project-name" {
  type        = string
  description = "used as the main part of the name of the virtual machine"
}

variable "resource-prefixes" {
  type        = list(string)
  description = "these are prefixed to resource names and usually include the tenant short name and/or the environment name"

  default = []
}

variable "resource-suffixes" {
  type        = list(string)
  description = "these are appended to resource names and usually include the numbers when multiple resource with the same name exist"

  default = []
}

variable "firewall-ip" {
  type        = string
  default = null
  description = "ip address of the firewall used for forward subnet traffic to the internet"
}

variable "vnet-address-space" {
  type        = list(string)
  description = "address space of the virtual network for this landing zone"
}

variable "subnets" {
  type = list(object({
    name          = string
    address-space = string
    service-endpoints = optional(list(string),[])
  }))
  default     = null
  nullable    = true
  description = "list of subnets to be created in the virtual network"
}

variable "dns-servers" {
  type        = list(string)
  default     = null
  description = "list of dns servers to be used in the virtual network"
}

variable "global-tags" {
  type        = map(string)
  default     = {}
  description = "tags to be applied to all resources"
}
