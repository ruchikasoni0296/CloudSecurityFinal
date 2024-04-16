resource "azurerm_availability_set" "linux-availability-set" {
  name                = "${var.linux_name}-linux_avs"
  location            = var.resource_group-linux-location
  resource_group_name = var.resource_group-linux-name

  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  tags                         = local.common_tags
}

resource "azurerm_linux_virtual_machine" "linux-vm" {
  count               = var.nb_count
  name                = "${var.linux_name}${count.index + 1}"
  location            = var.resource_group-linux-location
  resource_group_name = var.resource_group-linux-name

  network_interface_ids = [element(azurerm_network_interface.linux-nic[*].id, count.index + 1)]
  size                  = var.linux_size

  admin_username                  = var.linux_admin_username
  disable_password_authentication = true


  os_disk {
    name                 = "${var.linux_name}-os-disk-${count.index + 1}"
    caching              = var.linux_os_disk_caching
    storage_account_type = var.linux_os_disk_storage_account_type
    disk_size_gb         = var.linux_os_disk_size
  }

  source_image_reference {
    publisher = var.ubuntu_publisher
    offer     = var.ubuntu_offer
    sku       = var.ubuntu_sku
    version   = var.ubuntu_version
  }
  admin_ssh_key {
    username   = var.linux_admin_username
    public_key = file(var.linux_public_key)
  }
  tags = local.common_tags
}

resource "azurerm_network_interface" "linux-nic" {
  count               = var.nb_count
  name                = "${var.linux_name}-nic-${count.index + 1}"
  location            = var.resource_group-linux-location
  resource_group_name = var.resource_group-linux-name

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig-${count.index + 1}"
    subnet_id                     = var.linux_subnet
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.linux-pip[*].id, count.index + 1)
  }
  tags = local.common_tags

}

resource "azurerm_public_ip" "linux-pip" {
  count               = var.nb_count
  name                = "${var.linux_name}-pip-${count.index + 1}"
  location            = var.resource_group-linux-location
  resource_group_name = var.resource_group-linux-name
  domain_name_label   = "${var.linux_name}-${count.index + 1}"

  allocation_method = "Dynamic"
  tags              = local.common_tags

}