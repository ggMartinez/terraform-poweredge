terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.7.4"
    }
  }
}

provider "proxmox" {
  pm_api_url = var.proxmoxUrl
  pm_api_token_id = var.proxmoxToken
  pm_api_token_secret = var.proxmoxSecret
  pm_tls_insecure = true
}
