resource "aws_instance" "terraform" {
  count                  = length(var.instance_name)
  ami                    = data.aws_ami.joindevops.id
  instance_type          = var.instance_name[count.index] == "mysql" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

  tags = {
    Name = var.instance_name[count.index]
  }
}



resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow ssh"
  description = "all port number 22 for ssh access"

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # allowing everyone
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

