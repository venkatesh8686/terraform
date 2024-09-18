resource "aws_instance" "terraform" {
    count = 3
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    
    tags = merge(

        var.comman_tags,
        {
        Name = var.instances_name[count.index]
    }
    ) 
}



resource "aws_security_group" "allow_ssh_terraform" {
    name= "allow ssh"
    description= "all port number 22 for ssh access"

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
     tags = merge (
        var.comman_tags,
        {
        Name = "allow ssh"
    }
    ) 
}

