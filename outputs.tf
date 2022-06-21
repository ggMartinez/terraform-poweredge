output "DockerVMsInfo" {
	value = [module.docker-vm.vm1-ip,module.docker-vm.vm2-ip]
}
