module "proxmox-vm" {
  source = "../../modules/proxmox/VM"
  sshKey = var.sshKey
  networkIp = "192.168.1.30"
  name = "DockerTest"
  dataFile = "${path.module}/userData.sh"
}