variable "vm_name" {
  type = string
  description = "Name of VM"
  

}

variable "location" {
  type = string
  description = "Region RG is located "
  default = "eastus2"
}

variable "env" {
  type = string
  description = "name of env...dev,prod,qa"
  
}