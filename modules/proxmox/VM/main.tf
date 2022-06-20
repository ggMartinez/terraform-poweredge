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


resource "proxmox_vm_qemu" "proxmox-vm" {
  count = var.count
  name = "${var.name}-${count.index + 1}" 
  target_node = var.proxmoxHost
  clone = var.templateName
  agent = 1
  os_type = "cloud-init"
  cores = var.cpuCores
  sockets = var.cpuSockets
  cpu = "host"
  memory = var.Memory
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"
  disk {
    slot = 0
    size = var.diskSize
    type = "scsi"
    storage = "local-zfs"
    iothread = 1
  }
  network {
    model = "virtio"
    bridge = "vmbr0"
  }
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  ipconfig0 = "ip=${var.networkIp}/24,gw=${var.networkGateway}"
  sshkeys = <<EOF
  ${var.sshKey}
  EOF
}