terraform {
  required_providers {
    proxmox = {
      source = "blz-ea/proxmox"
    }
  }
}

provider "proxmox" {
  virtual_environment {}
}   