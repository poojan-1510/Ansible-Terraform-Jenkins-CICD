variable "vpc_cidrblock" {
  type        = string
  description = "cidr range for the vpc"
  default     = "10.0.0.0/16"
}

variable "vpc_dns_enable" {
  type        = bool
  description = "checks if the dns support nad host should be enables "
  default     = true
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR for public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR for private subnet"
  default     = "10.0.2.0/24"
}

variable "instance_type" {
  type        = string
  description = "instance type for ec2 vm"
  default     = "t2.micro"
}

variable "instance_ami" {
  type        = string
  description = "ec2 vm ami for us-east-2"
  default     = "ami-0f5fcdfbd140e4ab7"
}

variable "aws_region" {
  type        = string
  description = "regions for all the resources"
  default     = "us-east-2"
}

variable "aws_key" {
  type        = string
  description = "aws pem key name to authenticate"
  default     = "Main-AWS"
}