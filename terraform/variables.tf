variable "ssh_file" {
  default =  "/home/larbin/.ssh/tf_ssh.pub"
}
variable "endpoint_node" {
  default =  "proxmoxf17"
}
variable "clone_node" {
  default =  "ejbca-ubu24"
}
variable "user_name" {
  default = "honey"
}
variable "password" {
  default = "wxC11102"
}
variable "template_id" {
  default = "2000"
}
variable "clone_id" {
  default = "2001"
}
variable "datastore_id" {
  default = "local"
}
variable "template_disk_size" {
  default = 10 # en GigaOctets imposée par le template (8 par défaut)
}
