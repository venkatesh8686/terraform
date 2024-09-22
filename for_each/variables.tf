variable "instance" {
  type        = map
  default    = {
    mysql = "t3.small"
    backend = "t3.micro"
    frontend = "t3.micro"
  }
}

variable "domain_name" {
  default = "vvsmgold.online"
}

variable "hosted_id" {
  default = "Z05933623RG0R1RYV0WW2"
}