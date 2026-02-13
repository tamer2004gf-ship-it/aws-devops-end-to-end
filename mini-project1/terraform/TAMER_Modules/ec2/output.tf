output "public_instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.web.id
}

output "public_instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.web.private_ip
}

output "public_instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.web.public_ip
}
