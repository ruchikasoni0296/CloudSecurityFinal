resource "null_resource" "linux_provisioner" {
  count      = var.nb_count
  depends_on = [azurerm_linux_virtual_machine.linux-vm]
  connection {
    type        = "ssh"
    user        = var.linux_admin_username
    private_key = file(var.linux_private_key)
    host        = element(azurerm_public_ip.linux-pip[*].fqdn, count.index + 1)
  }
  provisioner "remote-exec" {
    inline = [
      "/usr/bin/hostname"
    ]
  }
}