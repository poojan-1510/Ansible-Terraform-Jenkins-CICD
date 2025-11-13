resource "aws_instance" "bastion_server" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.bastion.id]
  subnet_id              = aws_subnet.public.id

  root_block_device {
    volume_size           = 8
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
