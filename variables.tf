variable "location" {
  description = "The Azure region to deploy resources in."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "vm_admin_username" {
  description = "The admin username for the VM."
  type        = string
}

variable "ssh_public_key" {
  description = "The SSH public key for VM authentication."
  type        = string
}

variable "environment" {
  description = "The environment tag for resources."
  type        = string
}

variable "owner" {
  description = "The owner tag for resources."
  type        = string
}