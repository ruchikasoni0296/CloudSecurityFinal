locals {
  common_tags_win = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "n01610736@humber.ca"
    Environment  = "Lab"
  }
}
variable "windows_avs" {

}
variable "resource-group-windows-loc" {

}
variable "resource-group-windows-name" {

}
variable "windows_name" {
  type = map(string)
  default = {
    n01610736-w-vm1 = "Standard_B1s"
  }
}
variable "windows-network-subnet" {

}
variable "location" {

}
variable "windows_admin_username" {

}
variable "windows_admin_password" {

}
variable "windows_disk_caching" {

}
variable "windows_storage_account_type" {

}
variable "windows_disk_size" {

}
variable "windows_publisher" {

}
variable "windows_offer" {

}
variable "windows_sku" {

}
variable "windows_version" {

}