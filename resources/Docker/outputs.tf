output "vm-ip" {
   description = "VM Name and IP Address"
   value = module.proxmox-vm.VM-Information
}