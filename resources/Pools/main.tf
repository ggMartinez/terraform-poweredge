module "vms" { 
    source = "../../modules/proxmox/Pool"
    id = "VMs"
    comment = "VMs Pool"
}
