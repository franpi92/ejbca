	terraform {
	  required_providers {
	    proxmox = {
	      source  = "bpg/proxmox"
	      version = "0.66.1" # Version compatible Proxmox 8.x
	    }
	  }
	}


provider "proxmox" {
  insecure  = true
}
