
terraform {
  backend "consul" {
    scheme   = "http"
    path     = "terraform/terraform.tfstate"
    lock     = true
    gzip     = false
  }
}