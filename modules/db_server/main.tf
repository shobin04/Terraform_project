resource "aws_instance" "db" {
  count               = var.db_instance_count
  ami                 = var.db_ami
  instance_type       = var.db_instance_type
  subnet_id           = var.db_tier_subnet_id
  key_name            = var.key_name
  security_groups     = [var.db_sg_id]
  associate_public_ip_address = false

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
  }

  ebs_block_device {
    device_name = var.ebs_device_name
    volume_size = var.ebs_volume_size
    volume_type = var.ebs_volume_type
  }

  tags = {
    Name = "${var.db_name}${count.index + 1}"
  }
}