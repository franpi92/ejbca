	resource "proxmox_virtual_machine" "ubuntu_server" {
	  name        = "ejbca_ubu24"
	  description = "Managed by Terraform"
	  node_name   = "proxmox17"
	  vm_id       = 2001 # Un ID libre
	
	  clone {
	    vm_id = 2000 # Votre template ID
	  }
	
	  initialization {
	    ip_config {
	      ipv4 {
	        address = "10.205.10.10/24"
	        gateway = "10.205.10.1"
	      }
	    }
	
	    user_account {
	      username = "honey"
	      password = "wxC11102" # Note: Il est recommandé d'utiliser des hash en prod
	    }
	  }
	
	  network_device {
	    bridge = "vmbr0"
	  }
	
	  cpu {
	    cores = 2
	  }
	
	  memory {
	    dedicated = 4096
	  }
	
	
	  # Déclenche Ansible après la création
	  provisioner "local-exec" {
	    command = "ansible-playbook -i 10.205.10.3, -u honey --private-key /home/larbin/.ssh/tf_ssh playbook.yml"
	  }
	}
