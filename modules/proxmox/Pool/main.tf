resource "proxmox_virtual_environment_pool" "pool" {
  comment = var.comment
  pool_id = var.id 
}

