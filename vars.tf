variable "prefix" {
  description = "The prefix to be used with all project resources."
  type = string
  default = "udacity-project"
}

variable "location" {
  description = "The Azure region in which all resources in this project will be created."
  type = string
  default = "Central US"
}

variable "context" {
  description = "The purpose/focus of the resources. Used with tagging."
  type = string
  default = "UdacityProject"
}

variable "username" {
  description = "The username that will be used to access the virtual machine generated by terraform scripts."
  type = string
  default = "AzureUser"
}

variable "password" {
  description = "The password associated with the username used for virtual machine access."
  type = string
}

variable "virtual_machine_count" {
  description = "The number of virtual machines to be deployed"
  type = number
  default = 2
}
