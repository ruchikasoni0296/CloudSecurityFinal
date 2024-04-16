output "network-vnet" {
  value = azurerm_virtual_network.vnet
}

output "network-subnet1" {
  value = azurerm_subnet.subnet1
}

output "network-subnet2" {
  value = azurerm_subnet.subnet2
}

output "network-nsg1" {
  value = azurerm_network_security_group.nsg1
}

output "network-nsg2" {
  value = azurerm_network_security_group.nsg2
}
