resource "aws_instance" "mobileapp" {
  count         = var.mobileapp_instance_count * length(var.mobile_tier_subnet_ids)
  ami             = var.mobileapp_ami
  instance_type   = var.mobileapp_instance_type
  subnet_id     = element(var.mobile_tier_subnet_ids, floor(count.index / var.mobileapp_instance_count))
  security_groups = [var.mobileapp_sg_id]
  associate_public_ip_address = false
  key_name = var.key_name

  dynamic "ebs_block_device" {
    for_each = var.mobileapp_ebs_volumes
    content {
      device_name           = ebs_block_device.value.device_name
      volume_type           = ebs_block_device.value.volume_type
      volume_size           = ebs_block_device.value.volume_size
      delete_on_termination = ebs_block_device.value.delete_on_termination
    }
  } 

  tags = {
    Name = "${var.mobileapp_name}-${count.index + 1}"
  }
}