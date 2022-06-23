 module "rancher-vm"{
  source = "github.com/ggMartinez/terraform-proxmox-modules//VM"
  sshKey = var.sshKey
  networkDhcp = false 
  networkIp = "192.168.1.49"
  name = "DockerTest"
  dataFile = "${path.module}/userData.sh"
}
