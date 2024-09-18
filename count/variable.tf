variable "instances_name" {
  type        = list(string)
  default     = ["mysql","backend","frontend"]
  description = "Setting inc names"
}

variable "comman_tags" {
    type = map
    default = {
        project = "expense"
        envinorment = "dev"
        terraform = "true"
    }
}
