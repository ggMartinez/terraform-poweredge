terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.7.4"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://192.168.1.4:8006/api2/json"
  pm_api_token_id = "root@pam!terraform"
  pm_api_token_secret = "fdd0f2a1-6cf4-41a2-ba0a-c4f8ea251a6f"
  pm_tls_insecure = true
}
