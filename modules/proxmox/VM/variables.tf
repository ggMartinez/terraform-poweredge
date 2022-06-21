variable "sshKey" {}
variable "name" {}
variable "vmCount" {default = 1}
variable "proxmoxHost" {default = "prosmos"}
variable "templateName" {default = "centos7-template"}
variable "cpuCores"{default = "1"}
variable "cpuSockets"{default = "1"}
variable "Memory"{default = "1024"}
variable "diskSize" {default = "10G"}
variable "networkIp" {default = null}
variable "networkGateway" {default = "192.168.1.1"}
variable "networkDhcp" {default = true}
variable "dataFile" {default = ""}
variable "pool" {default = ""}
variable "runState" {default = ""}





