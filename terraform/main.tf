	data "local_file" "ssh_public_key" {
	  filename = var.ssh_file
	}

	provider "proxmox" {
		insecure = true # Required for self-signed certificates
	}

	resource "proxmox_virtual_environment_vm" "ubu24_vm" {
	  node_name = var.endpoint_node
	  name      = var.clone_node
	  vm_id     = var.clone_id
	  disk {
		datastore_id = var.datastore_id
    size		     = var.template_disk_size
		interface    = "scsi0"
	  }

	  clone {vm_id = var.template_id}
      cpu {
		cores = 2
		type  = "host"
	  }
	  memory         {dedicated = 4096}
	  network_device {bridge    = "vmbr0"}
	  
	  initialization {
	  	datastore_id = var.datastore_id # OBLIGATOIRE avec le provider BPG
	  
	  	ip_config {
	  	  ipv4 {
	  		address = "10.205.10.10/24"
	  		gateway = "10.205.10.1"
	  	  }
	  	}
	  
	  	user_account {
	  	  username = var.user_name
	  	  password = var.password
	  	}
	  }
	  
	  provisioner "local-exec" {
	  	command = "sleep 30 && ansible-playbook -i 10.205.10.3, -u honey playbook.yml"
	  }
	}
