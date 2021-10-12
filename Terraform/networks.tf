resource "aws_vpc" "vpc_tp_terraform" {
  cidr_block           = "172.16.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name        = "test-terraform-vpc"
    Terraform   = "True"
    Description = "VPC for the lab"
  }
}

resource "aws_subnet" "subnet_public" {
  vpc_id                  = aws_vpc.vpc_tp_terraform.id
  cidr_block              = "172.16.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name        = "subnet-public"
    Terraform   = "True"
    Description = "Subnet for the lab"
  }
}
resource "aws_subnet" "subnet_public_two" {
  vpc_id                  = aws_vpc.vpc_tp_terraform.id
  cidr_block              = "172.16.3.0/24"
  availability_zone       = "us-east-1e"
  map_public_ip_on_launch = "true"
  tags = {
    Name        = "subnet-public-two"
    Terraform   = "True"
    Description = "Subnet for the lab"
  }
}

resource "aws_subnet" "subnet_internal" {
  vpc_id                  = aws_vpc.vpc_tp_terraform.id
  cidr_block              = "172.16.2.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name        = "subnet-internal"
    Terraform   = "True"
    Description = "Subnet for the lab"
  }
}

resource "aws_subnet" "subnet_internal_two" {
  vpc_id                  = aws_vpc.vpc_tp_terraform.id
  cidr_block              = "172.16.4.0/24"
  availability_zone       = "us-east-1e"
  map_public_ip_on_launch = "true"
  tags = {
    Name        = "subnet-internal-two"
    Terraform   = "True"
    Description = "Subnet for the lab"
  }
}

resource "aws_internet_gateway" "gateway_tp_terraform" {
  vpc_id = aws_vpc.vpc_tp_terraform.id
  tags = {
    Name        = "test-terraform-gateway"
    Terraform   = "True"
    Description = "Gateway for the lab"
  }
}

resource "aws_default_route_table" "defaultroutetable_tp_terraform" {
  default_route_table_id = aws_vpc.vpc_tp_terraform.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway_tp_terraform.id
  }
  tags = {
    Name        = "test-terraform-rt"
    Terraform   = "True"
    Description = "Route Table for the lab"
  }
} 