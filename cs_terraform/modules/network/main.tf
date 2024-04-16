resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_space
  location            = var.location
  resource_group_name = var.network-rg
}

resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet1
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.resource_group_net_name
  address_prefixes     = var.subnet1_space
}

resource "azurerm_subnet" "subnet2" {
  name                 = var.subnet2
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.resource_group_net_name
  address_prefixes     = var.subnet2_space
}

resource "azurerm_network_security_group" "nsg1" {
  name                = var.net_security_group1
  location            = var.resource_group_net_loc
  resource_group_name = var.resource_group_net_name

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_network_security_group" "nsg2" {
  name                = var.net_security_group2
  location            = var.resource_group_net_loc
  resource_group_name = var.resource_group_net_name

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "rule2"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg-asso1" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}

resource "azurerm_subnet_network_security_group_association" "nsg-asso2" {
  subnet_id                 = azurerm_subnet.subnet2.id
  network_security_group_id = azurerm_network_security_group.nsg2.id
}