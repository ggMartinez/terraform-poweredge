 module "proxmox-vm"{
  source = "github.com/ggMartinez/terraform-proxmox-modules//VM"
  sshKey = var.sshKey
  networkDhcp = true
  name = "DockerTest"
  dataFile = "${path.module}/userData.sh"
}
