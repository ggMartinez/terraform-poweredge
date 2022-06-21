output "DockerVMsInfo" {
	value = {
		module.docker-vm.vm-ip
		module.docker-vm.vm2-ip
	}
		
}
