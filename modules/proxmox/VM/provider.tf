terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.7.4"
    }

    proxmox-pools = {
      source = "blz-ea/proxmox"
      version = "0.3.3"
    }
  }
}
