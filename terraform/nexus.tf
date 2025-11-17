resource "aws_instance" "nexus_server" {
  ami                    = var.instance_ami
  instance_type          = "t2.medium"
  vpc_security_group_ids = [aws_security_group.nexus.id]
  subnet_id              = aws_subnet.private.id

  root_block_device {
    volume_size           = 50
    volume_type           = "gp3" # General purpose SSD
    delete_on_termination = true

    tags = {
      Name = "Root Volume"
    }
  }

  key_name = var.aws_key

  tags = {
    Name = "Project1"
  }
}
