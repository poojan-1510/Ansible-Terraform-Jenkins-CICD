terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-2"
}


resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "jenkins from anywhere"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# --- EC2 instance ---
resource "aws_instance" "example_server" {
  ami                    = "ami-0f5fcdfbd140e4ab7"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  root_block_device {
    volume_size           = 20    # 20 GB root volume
    volume_type           = "gp3" # General purpose SSD
    delete_on_termination = true

    tags = {
      Name = "Poojan Shah root Volume"
    }
  }

  key_name = "Main-AWS"

  tags = {
    Name = "Project1"
  }
}

# --- Output the public IP ---
output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.example_server.public_ip
}
