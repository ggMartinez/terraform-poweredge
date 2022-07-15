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

 module "k8s-master-worker-vm"{
  source = "github.com/ggMartinez/terraform-proxmox-modules//VM"
  sshKey = var.sshKey
  networkDhcp = false 
  networkIp = "192.168.1.51"
  cpuCores = "2"
  Memory = "4096"
  name = "K8sMasterWorker"
  pool = module.kubernetes-pool.id
  dataFile = "${path.module}/scripts/rancher.sh"
}

