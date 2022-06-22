 module "proxmox-vm"{
  source = "github.com/ggMartinez/terraform-proxmox-modules//VM"
  sshKey = var.sshKey
  networkDhcp = false
  networkIp = "192.168.1.199"
  name = "GitlabRunner"
  dataFile = "${path.module}/userData.sh"
}
