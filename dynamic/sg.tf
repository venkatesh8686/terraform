resource "aws_security_group" "allow_ssh_terraform" {
    name= "dynamic demo"
    description= "all port number 22 for ssh access"

    # terraform gives us block name
    dynamic "ingress" {
        
        for_each = var.ingress_rules
        content {
            from_port   = ingress.value["from_port"]
            to_port     = ingress.value["to_port"]
            protocol    = ingress.value["protocol"]
            cidr_blocks = ingress.value["cidr_blocks"]
        }
  }

  # in egress we allow all trafic
  egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
  }
    tags = {
        Name = "Allow ssh"
    }
}