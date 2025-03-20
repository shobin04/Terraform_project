# Application Load Balancer for WebApp
resource "aws_lb" "webapp_alb" {
  name               = var.webapp_alb_name
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.webapp_alb_sg_id]
  subnets            = var.subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = var.webapp_alb_name
  }
}

# Target Group for WebApp
resource "aws_lb_target_group" "webapp_tg" {
  name     = "${var.webapp_alb_name}-web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "webapp-target-group"
  }
}

# Register Web App Instances with the Target Group
resource "aws_lb_target_group_attachment" "webapp_tg_attachment" {
  count            = length(var.webapp_instance_ids)
  target_group_arn = aws_lb_target_group.webapp_tg.arn
  target_id        = var.webapp_instance_ids[count.index]
  port             = 80
}

# HTTP Listener for WebApp
resource "aws_lb_listener" "webapp_http" {
  load_balancer_arn = aws_lb.webapp_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webapp_tg.arn
  }
}
