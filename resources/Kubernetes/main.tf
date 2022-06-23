 module "kubernetes-pool"{
  source = "github.com/ggMartinez/terraform-proxmox-modules//Pool"
  id = "K8s"
  comment = "Kubernetes Cluster"
}


 module "rancher-vm"{
  source = "github.com/ggMartinez/terraform-proxmox-modules//VM"
  sshKey = var.sshKey
  networkDhcp = false 
  networkIp = "192.168.1.50"
  cpuCores = "2"
  memory = "2048"
  name = "Rancher"
  pool = module.kubernetes-pool.id
  dataFile = "${path.module}/userData.sh"
}
