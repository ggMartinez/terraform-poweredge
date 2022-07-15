 module "kubernetes-pool"{
  source = "github.com/ggMartinez/terraform-proxmox-modules//Pool"
  id = "K8s"
  comment = "Kubernetes Cluster"
}

 module "k8s-masters-vm"{
  source = "github.com/ggMartinez/terraform-proxmox-modules//VM"
  sshKey = var.sshKey
  vmCount = 3
  networkDhcp = false 
  networkIp = "192.168.1.5"
  cpuCores = "1"
  Memory = "1024"
  name = "K8sMaster"
  pool = module.kubernetes-pool.id
  dataFile = "${path.module}/scripts/k8sMasterWorker.sh"
}


 module "k8s-workers-vm"{
  source = "github.com/ggMartinez/terraform-proxmox-modules//VM"
  sshKey = var.sshKey
  vmCount = 3
  networkDhcp = false 
  networkIp = "192.168.1.5"
  cpuCores = "2"
  Memory = "2048"
  name = "K8sMaster"
  pool = module.kubernetes-pool.id
  dataFile = "${path.module}/scripts/k8sMasterWorker.sh"
}
