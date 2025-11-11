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
