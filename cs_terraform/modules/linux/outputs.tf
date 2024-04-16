output "linux_vm_avs" {
  value = azurerm_availability_set.linux-availability-set.name
}

output "virtual_network_name" {
  value = azurerm_network_interface.linux-nic[*].name
}

output "hostname" {
  value = [azurerm_linux_virtual_machine.linux-vm[*].name]
}

output "vm_fqdn" {
  value = azurerm_public_ip.linux-pip[*].fqdn
}

output "public_ip" {
  value = azurerm_public_ip.linux-pip[*].ip_address
}

output "private_ip" {
  value = azurerm_network_interface.linux-nic[*].private_ip_address
}

