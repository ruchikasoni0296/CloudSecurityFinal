module "resource_groups" {
  source = "./modules/resource_group"

  network-rg = "network-rg"
  linux-rg   = "linux-rg"
  windows-rg = "windows-rg"
  location   = "Canada Central"
}

module "network" {
  source = "./modules/network"

  vnet_name               = "vnet-lab6"
  network-rg              = module.resource_groups.network-rg.name
  location                = module.resource_groups.network-rg.location
  vnet_space              = ["10.0.0.0/16"]
  resource_group_net_name = module.resource_groups.network-rg.name
  resource_group_net_loc  = module.resource_groups.network-rg.location
  subnet1                 = "subnet1"
  subnet1_space           = ["10.0.1.0/24"]
  subnet2                 = "subnet2"
  subnet2_space           = ["10.0.2.0/24"]
  net_security_group1     = "nsg1"
  net_security_group2     = "nsg2"
}

module "linux" {
  source = "./modules/linux"

  linux_avs                          = "linux-avs"
  location                           = module.resource_groups.linux-rg.location
  nb_count                           = 2
  resource_group-linux-name          = module.resource_groups.linux-rg.name
  resource_group-linux-location      = module.resource_groups.linux-rg.location
  linux_name                         = "n01610736-c-vm"
  linux_size                         = "Standard_B1s"
  linux_admin_username               = "n01610736ruchika"
  linux_public_key                   = "/home/n01610736ruchika/.ssh/id_rsa.pub"
  linux_private_key                  = "/home/n01610736ruchika/.ssh/id_rsa"
  linux_os_disk_storage_account_type = "Standard_LRS"
  linux_os_disk_size                 = 32
  linux_os_disk_caching              = "ReadWrite"
  ubuntu_publisher                   = "OpenLogic"
  ubuntu_version                     = "latest"
  ubuntu_sku                         = "8_5-gen2"
  ubuntu_offer                       = "CentOS"
  linux_subnet                       = module.network.network-subnet1.id
}

module "windows" {
  source = "./modules/windows"

  windows_avs                  = "windows-avs"
  location                     = module.resource_groups.windows-rg.location
  resource-group-windows-name  = "n01610736-w-vm"
  resource-group-windows-loc   = module.resource_groups.windows-rg.location
  windows_admin_username       = "n01610736winruchika"
  windows_admin_password       = "01610736@Winuser"
  windows_storage_account_type = "Standard_LRS"
  windows_disk_size            = 128
  windows_disk_caching         = "ReadWrite"
  windows_publisher            = "MicrosoftWindowsServer"
  windows_offer                = "WindowsServer"
  windows_sku                  = "2019-Datacenter"
  windows_version              = "latest"
  windows-network-subnet       = module.network.network-subnet2.id
}