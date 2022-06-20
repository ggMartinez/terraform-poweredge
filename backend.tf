
terraform {
  backend "consul" {
    address  = "192.168.1.4:8500"
    scheme   = "http"
    path     = "tf/terraform.tfstate"
    lock     = true
    gzip     = false
  }
}