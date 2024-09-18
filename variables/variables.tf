variable "ami_id" {

  type = string
  default = "ami-09c813fb71547fc4f"
  description   = "this is ami_id for Rhel 9.0 for devops practices"

}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "tags" {
    type = map
    default = {
        Name = "backend"
        project = "Expense"
        compenent = "backend"
        Envinorment = "DEV"
        terraform = "Yes"

    }   
}

variable "sg_name" {
    default = "allow ssh"
}

variable "description_sg" {
    default = "all port number 22 for ssh access"
}

variable "from_port" {
    type = number
    default = 22
}

variable "to_port" {
    type = number
    default = 22
}
variable "protocol" {
    type = string
    default = "tcp"
}

variable "cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
}
