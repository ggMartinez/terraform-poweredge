 module "proxmox-vm"{
  source = "../../modules/proxmox/VM"
  sshKey = var.sshKey
  networkDhcp = true
  name = "DockerTest"
  pool = "VMs"
  dataFile = "${path.module}/userData.sh"
}
