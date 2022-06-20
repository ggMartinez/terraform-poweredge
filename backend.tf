
terraform {
  backend "consul" {
    address  = "localhost:8500"
    scheme   = "http"
    path     = "tf/terraform.tfstate"
    lock     = true
    gzip     = false
  }
}