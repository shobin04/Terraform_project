resource "aws_lb" "alb" {
  name               = var.webapp_alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.webapp_alb_sg_id]
  subnets            = var.subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = var.webapp_alb_name
  }
}

# Target Group for Web Tier
resource "aws_lb_target_group" "web_tg" {
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
    Name = "web-target-group"
  }
}

# Register Web App Instances with the Target Group
resource "aws_lb_target_group_attachment" "web_tg_attachment" {
  count            = length(aws_instance.webapp_server)
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = aws_instance.webapp_server[count.index].id
  port             = 80
}

# HTTP Listener
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}
