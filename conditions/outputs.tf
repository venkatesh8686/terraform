output "Public_ip" {
  value       = aws_instance.terraform.public_ip
  sensitive   = false
  description = "Inc public Ip"
  
}
