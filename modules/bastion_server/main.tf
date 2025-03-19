resource "aws_instance" "bastion" {
  ami             = var.bastion_ami
  instance_type   = var.bastion_instance_type
  subnet_id       = var.public_subnet_id
  security_groups = [var.bastion_sg_id]
  associate_public_ip_address = true
  key_name = var.key_name
  tags = {
    Name = var.bastion_name
  }
}
