resource "proxmox_vm_qemu" "proxmox-vm" {
connection {
    type        = "ssh"
    user        = self.ssh_user
    private_key = "${file("~/.ssh/terraform")}"
    host        = self.ssh_host
    port        = self.ssh_port
  }

provisioner "remote-exec" {
     script  = "./test.sh"
    
  }
  ssh_user = "centos"

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
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDJst1pz+r/BPcE/pDDst6tYaHhn0U5eV0k66szHVoUQpz053SI1zjobPhU05P0dR3kI/KBub2jPKrDypHgq9UDYkKYMQgxhgrcNZB4TSXIVo/0qi0J92i5g/wP/qSxuIaFwEdz+oeKRYRZlP2bO2DnROd6uppXt0g/29q7QvJZBlDDHxQT+tIWFnOcuVfcKGjcrkHXDn4SuLaggLimHzxGsYDra5VPfpdfWtINV1BPzllu67dEbQfzsaqCgcJRnRbkpDp2PkLlkf21mbRVXY5toG7Bg2RSHDT4rryMep1/x2+HSVe+vek7DxQxSzxLLnfFYfeDQl47Hqtxu9Hq90XTv76tE8QmVl1wsDtPS8MiTUosZQ3d7FKnwusrm/UJgvy6uZEOYoMp19y9aYHopbcB+YMbw9zaD31ChKdCXNnKF4hxMUbXz0hy4MhQ77RFffGu1nNgbEQxkNpcTNAUmh81WdToWlBFDSRzeHH3kHhkjSe/gQC2fWmkoM9TlVKL9UE= root@prosmos
  ${var.sshKey}
  EOF
}
