resource "aws_security_group" "redis_sg" {
  name        = var.redis_sg_name
  vpc_id      = var.vpc_id

  description = "Security group for Redis ElastiCache cluster"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.redis_sg_name
  }
}
