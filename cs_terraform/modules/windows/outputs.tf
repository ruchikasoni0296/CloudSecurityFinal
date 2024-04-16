output "windows_vm_hostname" {
  value = keys(azurerm_windows_virtual_machine.windows-vm)
}

output "windows_vm_fqdn" {
  value = values(azurerm_public_ip.windows-pip)[*].fqdn
}

output "windows_private_ip" {
  value = values(azurerm_windows_virtual_machine.windows-vm)[*].private_ip_address
}

output "windows_public_ip" {
  value = values(azurerm_windows_virtual_machine.windows-vm)[*].public_ip_address
}

output "windows_availability_set_name" {
  value = azurerm_availability_set.windows-availability-set.name
}

output "virtual_network_name" {
  value = values(azurerm_network_interface.windows-nic)[*].name
}
