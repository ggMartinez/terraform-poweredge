output "VM-Information" {
  description = "VM Name and IP Address"
  value = {
    for vm in proxmox_vm_qemu.proxmox-vm :
      vm.name => var.networkDhcp ? vm.ssh_host : split("/",split("=",split(",",vm.ipconfig0)[0])[1])[0]
  }
}
