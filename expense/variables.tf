variable "instances_name" {
  type        = list(string)
  default     = ["mysql","backend","frontend"]
  
}

variable "comman_tags" {
    type = map
    default = {
        project = "expense"
        envinorment = "dev"
        terraform = "true"
    }
}

variable "hosted_id" {
  default = "Z05933623RG0R1RYV0WW2"
}

variable "domain_name" {
  default = "vvsmgold.online"
}
