
terraform {
  backend "consul" {
    address  = var.consulUrl
    scheme   = "http"
    path     = "terraform/terraform.tfstate"
    lock     = true
    gzip     = false
  }
}