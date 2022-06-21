module "pool" { 
    source = "../../modules/proxmox/Pool"
    id = "Test"
    comment = "Test pool"
}
module "proxmox-vm" {
  source = "../../modules/proxmox/VM"
  sshKey = var.sshKey
  networkIp = "192.168.1.41"
  name = "Dockers"
  dataFile = "${path.module}/userData.sh"
}
 module "proxmox-vm-2"{
  source = "../../modules/proxmox/VM"
  sshKey = var.sshKey
  networkIp = "192.168.1.42"
  name = "Dockers"
  pool = module.pool.id
  dataFile = "${path.module}/userData.sh"
}
