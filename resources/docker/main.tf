module "proxmox-vm" {
  source = "../../modules/proxmox/VM"
  sshKey = var.sshKey
  networkIp = "192.168.1.3"
  name = "DockerTest"
  dataFile = "${path.module}/userData.sh"
  vmCount = 3
}
