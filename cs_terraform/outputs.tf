output "network-rg-name" {
  value = module.resource_groups.network-rg.name
}

output "linux-rg-name" {
  value = module.resource_groups.linux-rg.name
}

output "windows-rg-name" {
  value = module.resource_groups.windows-rg.name
}

output "network-rg-location" {
  value = module.resource_groups.network-rg.location
}

output "linux-rg-location" {
  value = module.resource_groups.linux-rg.location
}

output "windows-rg-location" {
  value = module.resource_groups.windows-rg.location
}

output "vnet-name" {
  value = module.network.network-vnet.name
}

output "vnet-address-space" {
  value = module.network.network-vnet.address_space
}

output "subnet1-name" {
  value = module.network.network-subnet1.name
}

output "subnet1-address-prefixes" {
  value = module.network.network-subnet1.address_prefixes
}

output "subnet2-name" {
  value = module.network.network-subnet2.name
}

output "subnet2-address-prefixes" {
  value = module.network.network-subnet2.address_prefixes
}

output "nsg1-name" {
  value = module.network.network-nsg1.name
}

output "nsg2-name" {
  value = module.network.network-nsg2.name
}

output "linux_vm_avs" {
  value = module.linux.linux_vm_avs
}

output "linux_virtual_network_name" {
  value = module.linux.virtual_network_name
}

output "linux_vm_hostname" {
  value = module.linux.hostname
}

output "linux_vm_fqdn" {
  value = module.linux.vm_fqdn
}

output "linux_public_ip" {
  value = module.linux.public_ip
}

output "linux_private_ip" {
  value = module.linux.private_ip
}

output "windows_vm_hostname" {
  value = module.windows.windows_vm_hostname
}

output "windows_vm_fqdn" {
  value = module.windows.windows_vm_fqdn
}

output "windows_private_ip" {
  value = module.windows.windows_private_ip
}

output "windows_public_ip" {
  value = module.windows.windows_public_ip
}

output "windows_vm_avs" {
  value = module.windows.windows_availability_set_name
}

output "windows_virtual_network_name" {
  value = module.windows.virtual_network_name
}
