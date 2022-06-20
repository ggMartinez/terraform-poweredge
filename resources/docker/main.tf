module "proxmox-vm" {
  source = "../../modules/proxmox"
  sshKey = var.sshKey
  networkIp = "192.168.1.30"
}