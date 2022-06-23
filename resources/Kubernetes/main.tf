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
  Memory = "2048"
  name = "Rancher"
  pool = module.kubernetes-pool.id
  dataFile = "${path.module}/scripts/rancher.sh"
}

#  module "k8s-master"{
#   source = "github.com/ggMartinez/terraform-proxmox-modules//VM"
#   sshKey = var.sshKey
#   networkDhcp = false 
#   networkIp = "192.168.1.51"
#   cpuCores = "2"
#   Memory = "2048"
#   name = "K8sMaster"
#   pool = module.kubernetes-pool.id
#   dataFile = "${path.module}/scripts/k8sMasters.sh"
# }



#  module "k8s-workers"{
#   source = "github.com/ggMartinez/terraform-proxmox-modules//VM"
#   sshKey = var.sshKey
#   networkDhcp = false 
#   networkIp = "192.168.1.6"
#   cpuCores = "2"
#   vmCount = 3
#   Memory = "2048"
#   name = "K8sWorker"
#   pool = module.kubernetes-pool.id
#   dataFile = "${path.module}/scripts/k8sWorkers.sh"
# }


