resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidrblock
  enable_dns_support   = var.vpc_dns_enable
  enable_dns_hostnames = var.vpc_dns_enable
  tags = {
    Name = "main-vpc"
  }
}