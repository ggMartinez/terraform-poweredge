resource "proxmox_vm_qemu" "proxmox-vm" {
  count = var.vmCount
  name = "${var.name}-${count.index + 1}" 
  ssh_user = "centos"
  target_node = var.proxmoxHost
  clone = var.templateName
  agent = 1
  pool = var.pool != "" ? var.pool : "VMs" 
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
  ipconfig0 = var.networkDhcp ? "ip=dhcp" : var.vmCount == 1 ? "ip=${var.networkIp}/24,gw=${var.networkGateway}" : "ip=${var.networkIp}${count.index + 1}/24,gw=${var.networkGateway}"  
  sshkeys = <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDbTYTzsMPPMuACn+CLkXTMjneeB3nHgV7s0REQ6EtR9Qta8mQpRRU6AHaM3OARr5XIRrvzy5uqMUaVrmuO/5cLEKItMf4b4q3+nL9+uXp+qO14wmBAM55vrarxhFXLiRJLwkh+7Wb8ix8O3mNKFyv1zjPp7Bv9h3H4zVdARgWuTQ5VHf9SkH9OMjA7nGVZCHYAksKlTZVTJGG1V+fT1OjygxGx14NyrTUDnQUHOR6WHyiI+FdgTLQw2utnBCflY0tmascYtbS/+sJoQHwk2j8qHmGkx+yaJZieHnjwvoO1JQQ8Gc46PIOfCRjkrn80DvLV6JiDjR7k6EiPju8V9CSeh6RJVw8SDmIwXqQwpip/00avTB6Ny3pZLFV+MdhweqFK3eDgZc4lD4U29ZO8h2XifzhPATRtfF/8uaYfE4/2TOElp/O5MO6ONsBROxw2isP5f1g4H3ifTNvTp0muC0gewhQNGodE8GzctAhf3We5Y49OMnhrxLMRF/TK3GTZS10= root@prosmos
${var.sshKey}
  EOF
}


resource "null_resource" "user-data"{
  count = var.dataFile != "" ? var.vmCount : 0
  connection {
    type        = "ssh"
    user        = proxmox_vm_qemu.proxmox-vm[count.index].ssh_user
    host        = proxmox_vm_qemu.proxmox-vm[count.index].ssh_host
    port        = proxmox_vm_qemu.proxmox-vm[count.index].ssh_port
    private_key = "${file("/tmp/id_rsa")}"
  }
  
  provisioner "remote-exec" {
    script  = var.dataFile
  }
}