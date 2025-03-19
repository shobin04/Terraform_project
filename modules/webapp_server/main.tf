resource "aws_instance" "webapp" {
  count         = var.webapp_instance_count * length(var.web_tier_subnet_ids)
  ami             = var.webapp_ami
  instance_type   = var.webapp_instance_type
  subnet_id     = element(var.web_tier_subnet_ids, floor(count.index / var.webapp_instance_count))
  security_groups = [var.webapp_sg_id]
  associate_public_ip_address = false
  key_name = var.key_name

  dynamic "ebs_block_device" {
    for_each = var.webapp_ebs_volumes
    content {
      device_name           = ebs_block_device.value.device_name
      volume_type           = ebs_block_device.value.volume_type
      volume_size           = ebs_block_device.value.volume_size
      delete_on_termination = ebs_block_device.value.delete_on_termination
    }
  }  

  tags = {
    Name = "${var.webapp_name}-${count.index + 1}"
  }
}