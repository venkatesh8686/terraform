resource "aws_security_group" "allow_ssh_terraform" {
    name = var.sg_name
    description = var.description_sg
    ingress {
        from_port   = var.from_port
        to_port     = var.to_port
        protocol    = var.protocol
        cidr_blocks = var.cidr_blocks # allowing everyone
  }
  # in egress we allow all trafic
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
  }
    tags = var.tags
}

resource "aws_instance" "terraform" {

    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    
    tags = var.tags
}