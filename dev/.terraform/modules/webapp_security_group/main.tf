resource "aws_security_group" "webapp_sg" {
  name        = var.webapp_sg_name 
  description = "private sg for the web app"
  vpc_id = var.vpc_id

ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [var.bastion_sg_id]
  }

   ingress {
    from_port       = 3389
    to_port         = 3389
    protocol        = "tcp"
    security_groups = [var.bastion_sg_id]
  }

  # Allow inbound HTTP from ALB security group
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.webapp_alb_sg_id]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}