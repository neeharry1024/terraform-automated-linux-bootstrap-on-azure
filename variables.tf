variable "resource_group_name" {
  default = "rg-linux-bootstrap"
}

variable "location" {
  default = "Central India"
}

variable "vm_name" {
  default = "bootstrap-vm"
}

variable "admin_username" {
  default = "azureuser"
}

variable "ssh_public_key" {
  type = string
}

variable "vm_size" {
  default = "Standard_B2s"
}
