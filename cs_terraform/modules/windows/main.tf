resource "azurerm_availability_set" "windows-availability-set" {
  name                = var.windows_avs
  location            = var.resource-group-windows-loc
  resource_group_name = var.resource-group-windows-name

  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  tags                         = local.common_tags_win
}

resource "azurerm_network_interface" "windows-nic" {
  for_each            = var.windows_name
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.resource-group-windows-name

  ip_configuration {
    name                          = "${each.key}-ipconfig"
    subnet_id                     = var.windows-network-subnet
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.windows-pip[each.key].id
  }
  tags = local.common_tags_win

}

resource "azurerm_public_ip" "windows-pip" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  location            = var.resource-group-windows-loc
  resource_group_name = var.resource-group-windows-name
  domain_name_label   = lower(replace(each.key, "[^a-zA-Z0-9]", ""))

  allocation_method = "Static"
  tags              = local.common_tags_win

}

resource "azurerm_windows_virtual_machine" "windows-vm" {
  for_each = var.windows_name

  name                = each.key
  computer_name       = each.key
  location            = var.resource-group-windows-loc
  resource_group_name = var.resource-group-windows-name

  admin_username        = var.windows_admin_username
  admin_password        = var.windows_admin_password
  network_interface_ids = [azurerm_network_interface.windows-nic[each.key].id]
  size                  = each.value

  os_disk {
    name                 = each.key
    caching              = var.windows_disk_caching
    storage_account_type = var.windows_storage_account_type
    disk_size_gb         = var.windows_disk_size
  }

  source_image_reference {
    publisher = var.windows_publisher
    offer     = var.windows_offer
    sku       = var.windows_sku
    version   = var.windows_version
  }
  winrm_listener {
    protocol = "Http"
  }

  tags = local.common_tags_win

}
