resource "aws_lb" "mobileapp_alb" {
  name               = var.mobileapp_alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.mobileapp_alb_sg_id]
  subnets            = var.subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = var.mobileapp_alb_name
  }
}

# Target Group for Web Tier
resource "aws_lb_target_group" "mobile_tg" {
  name     = "${var.mobileapp_alb_name}-mobile-tg"
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
    Name = "mobile-target-group"
  }
}

# Register Web App Instances with the Target Group
resource "aws_lb_target_group_attachment" "mobile_tg_attachment" {
  count            = length(var.mobileapp_instance_ids)
  target_group_arn = aws_lb_target_group.mobile_tg.arn
  target_id        = var.mobileapp_instance_ids[count.index]
  port             = 80
}

# HTTP Listener
resource "aws_lb_listener" "mobileapp_http" {
  load_balancer_arn = aws_lb.mobileapp_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mobile_tg.arn
  }
}
