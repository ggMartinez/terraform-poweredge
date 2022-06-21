 module "proxmox-vm"{
  source = "../../modules/proxmox/VM"
  sshKey = var.sshKey
  networkDhcp = true
  name = "DockerTest"
  dataFile = "${path.module}/userData.sh"
}
