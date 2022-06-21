module "pool" { 
    source = "../../modules/proxmox/Pool"
    id = "Test"
    comment = "Test pool"
}
module "proxmox-vm" {
  source = "../../modules/proxmox/VM"
  sshKey = var.sshKey
  networkIp = "192.168.1.41"
  name = "NoPoolTest"
  dataFile = "${path.module}/userData.sh"
}
 module "proxmox-vm2"{
  source = "../../modules/proxmox/VM"
  sshKey = var.sshKey
  networkIp = "192.168.1.42"
  name = "PoolTest"
  pool = module.pool.id
  dataFile = "${path.module}/userData.sh"
}
