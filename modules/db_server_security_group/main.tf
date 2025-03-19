resource "aws_security_group" "db_sg" {
  name        = var.db_sg_name
  description = "Private SG for the database"
  vpc_id      = var.vpc_id

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

  # Allow traffic only from the web app SG (e.g., for MySQL or PostgreSQL)
  ingress {
    from_port       = 3306          # Change this port to your DB port (e.g., 5432 for PostgreSQL)
    to_port         = 3306
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
    Name = "db-sg"
  }
}
