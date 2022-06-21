 module "proxmox-vm"{
  source = "../../modules/proxmox/VM"
  sshKey = var.sshKey
  networkDhcp = true
  name = "PoolTest"
  pool = module.pool.id
  dataFile = "${path.module}/userData.sh"
}
