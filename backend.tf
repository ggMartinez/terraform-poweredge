
terraform {
  backend "consul" {}
}

provider "consul" {
    address = var.consul_address
    scheme   = "http"
    path     = var.consul_path
    lock     = true
    gzip     = false
}

variable "consul_address" {}
variable "consul_path" {}