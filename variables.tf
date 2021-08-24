variable "rg_name" {
  description = "(Required) The name of the resource group in which the resources will be created"
}





variable "public_ip_name" {

}

variable "vm_name" {
 
}

variable "nsg_name" {
  description = "(Optional) Name of the availability set. Default is derived from vm_name"
  default     = ""
}

variable "nic_name" {

}

variable "ipconfig_name" {

}



variable "vm_size" {
 
}

variable "os_disk" {

}

variable "computer_name" {

}

variable "admin_username" {
  
}

variable "admin_password" {
  
}


