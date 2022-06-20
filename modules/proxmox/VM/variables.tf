variable "sshKey" {}
variable "name" {}
variable "vmCount" {default = 1}
variable "proxmoxHost" {default = "prosmos"}
variable "templateName" {default = "centos7-template"}
variable "cpuCores"{default = "1"}
variable "cpuSockets"{default = "1"}
variable "Memory"{default = "1024"}
variable "diskSize" {default = "10G"}
variable "networkIp" {}
variable "networkGateway" {default = "192.168.1.1"}






