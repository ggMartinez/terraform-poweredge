module "docker-vm" {
  source = "./resources/docker"
  sshKey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDdU6HM4iQoG7/H4S/d0bNEFWFqDbQDvO0boj3zeg3/HqxovoeHy49g/kDMSX1N7TWltL+9rdrqscyU1dNmnpdcox6MUlivMs0SxPF67gVwhCxhHCTm1w1suwgK4p7ydsSNGR4mF9Arg657oLJRMN0IARjT+BW1+ypuT+8K/Zqp9LO0ZfB73iFXB3gEkk9TRfmORZaworeuMM1nFXDMPG8WrJiXANOgLMlSvoYQ4VZ3KohOketK+t9/MwZ6FgP0LhlJv7sALiaXxGqOmSUOybX2vRcIabNHXbpqciNWSpO3KPMJ7JyvLyXZfskQzRbSdZTeNoZalgg1bjWFwdTOUKAN gmartinez@Asgard"
}

module "pool-vms" {
  source = "./resources/docker"
}