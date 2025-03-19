resource "aws_security_group" "elasticache_sg" {
  name        = var.elasticache_sg_name
  description = "Security group for ElastiCache cluster"
  vpc_id      = var.vpc_id

  # Allow inbound traffic from the application servers
  ingress {
    from_port       = var.elasticache_port
    to_port         = var.elasticache_port
    protocol        = "tcp"
    security_groups = [var.webapp_sg_id]  
  }

  # Egress rule to allow outbound traffic to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "elasticache-sg"
  }
}
