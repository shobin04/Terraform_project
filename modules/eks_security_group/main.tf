resource "aws_security_group" "eks_sg" {
  name        = var.eks_sg_name
  vpc_id      = var.vpc_id

  description = "EKS cluster security group"
  tags = var.tags
}

# Allow all outbound traffic
resource "aws_security_group_rule" "outbound_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.eks_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
  description = "Allow all outbound traffic"
}
