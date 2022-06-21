output "vm1-ip" {
   description = "VM Name and IP Address"
   value = module.proxmox-vm.VM-Information
}

output "vm2-ip" {
   description = "VM Name and IP Address"
   value = module.proxmox-vm2.VM-Information
}
