resource "aws_vpc" "alpha-vpc-tf" {
  cidr_block       = var.full_cidr_block
  instance_tenancy = "default"
  
  enable_dns_support = "true"
  enable_dns_hostnames ="true"
  
  tags = {
    Name = "alpha-vpc-tf"
  }
}