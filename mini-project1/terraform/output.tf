output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_instance_ip" {
  value = module.ec2.public_instance_public_ip
}

output "nat_gateway_ip" {
  value = module.eip.eip_public_ip
}

output "public_subnet_id" {
  value = module.subnet.public_subnet_id
}

output "private_subnet_id" {
  value = module.subnet.private_subnet_id
}

output "security_group_id" {
  value = module.security_group.security_group_id
}