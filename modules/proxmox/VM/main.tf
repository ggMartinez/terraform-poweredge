module "proxmox-provider" {
    source = "../provider"
}

resource "proxmox_vm_qemu" "proxmox-vm" {
  count = var.vmCount
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
    storage = "local-lvm"
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