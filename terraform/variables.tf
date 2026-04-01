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
variable "user_password" {
  default = "wxC11102"
}
variable "ip_address" {
  default = "10.205.10.4/24"
}
variable "ip_gw" {
  default = "10.205.10.1"
}
variable "template_id" {
  default = "2000"
}
variable "vlan_id" {
  default = "10"
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
variable "ansible_playbook" {
  default = "/home/larbin/old_Homelab_papa/ejbca/ansible/playbook.yml"
}
