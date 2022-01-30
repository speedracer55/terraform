output "Private_ip" {
  description = "Private IP address of VM"
  value = azurerm_network_interface.vide03-nic.private_ip_address
}