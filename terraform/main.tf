
	resource "proxmox_virtual_machine" "ejbca_server" {
	  name        = "ejbca-instance"
	  node_name   = var.target_node
	  vm_id       = 201
	
	  clone {
	    vm_id = 2000 # Votre template Ubuntu 24
	  }
	
	  cpu { cores = 2 }
	  memory { dedicated = 4096 }
	
	  network_device { bridge = "vmbr0" }
	
	  initialization {
	    datastore_id = "local_vm"
	    ip_config {
	      ipv4 {
	        address = "10.205.10.10/24"
	        gateway = "10.205.10.1"
	      }
	    }
	    user_account {
	      username = var.password
	      keys     = [var.ssh_key]
	    }
	  }
	
	  # Déclenche Ansible après la création
	  provisioner "local-exec" {
	    command = "ansible-playbook -i 10.205.10.10, -u ubuntu --private-key ~/.ssh/tf_ssh playbook.yml"
	  }
	}
