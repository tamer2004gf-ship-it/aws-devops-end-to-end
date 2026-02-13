# =====================================
# AWS Provider Configuration
# =====================================

provider "aws" {
  region = "eu-central-1"
}

# =====================================
# VPC Module
# =====================================

module "vpc" {
  source       = "./TAMER_Modules/vpc"
  vpc_cidr     = var.vpc_cidr
  project_name = var.project_name
}

# =====================================
# Subnet Module
# =====================================

module "subnet" {
  source               = "./TAMER_Modules/SubNet"
  vpc_id               = module.vpc.vpc_id  # 1(7 E9 VPC module
  project_name         = var.project_name
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidr  = var.private_subnet_cidr
}

# =====================================
# Internet Gateway Module
# =====================================

module "igw" {
  source       = "./TAMER_Modules/Internet Gatway"
  vpc_id       = module.vpc.vpc_id  
  project_name = var.project_name
}

# =====================================
# Elastic IP Module
# =====================================

module "eip" {
  source = "./TAMER_Modules/EIP"
  name   = var.project_name
}

# =====================================
# NAT Gateway Module
# =====================================

module "nat" {
  source              = "./TAMER_Modules/NAT"
  subnet_id           = module.subnet.public_subnet_id  
  allocation_id       = module.eip.eip_id  
  internet_gateway_id = module.igw.igw_id  
  project_name        = var.project_name
}

# =====================================
# Route Table Module
# =====================================

module "route_table" {
  source            = "./TAMER_Modules/RT"
  vpc_id            = module.vpc.vpc_id  
  igw_id            = module.igw.igw_id  
  nat_gateway_id    = module.nat.nat_gateway_id  
  public_subnet_id  = module.subnet.public_subnet_id  
  private_subnet_id = module.subnet.private_subnet_id 
  project_name      = var.project_name
}

# =====================================
# Security Group Module
# =====================================


module "security_group" {
  source = "./TAMER_Modules/SG"
  vpc_id = module.vpc.vpc_id  
  MY_IP  = var.MY_IP
}

# =====================================
# EC2 Instance Module
# =====================================


module "ec2" {
  source            = "./TAMER_Modules/ec2"
  ami_id            = "ami-0084a47cc718c111a"  #
  instance_type     = var.instance_type
  security_group_id = module.security_group.security_group_id  
  subnet_id         = module.subnet.public_subnet_id  
  key_pair_name     = var.key_pair_name
}
