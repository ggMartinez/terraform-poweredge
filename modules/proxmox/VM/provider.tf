terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.7.4"
    }

    proxmox-pools = {
      source = "blz-ea/proxmox"
    }
  }
}

provider "proxmox-pools" {
  virtual_environment {}
}   