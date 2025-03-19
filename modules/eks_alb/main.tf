resource "aws_lb" "alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = var.subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = var.alb_name
  }
}

# Target Group for Web Tier
resource "aws_lb_target_group" "web_tg" {
  name     = "${var.alb_name}-web-tg"
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

# Target Group for Mobile Tier
resource "aws_lb_target_group" "mobile_tg" {
  name     = "${var.alb_name}-mobile-tg"
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

# Target Group for EKS
resource "aws_lb_target_group" "eks_tg" {
  name     = "${var.alb_name}-eks-tg"
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
    Name = "eks-target-group"
  }
}

# # HTTPS Listener with Multiple Target Groups
# resource "aws_lb_listener" "https" {
#   load_balancer_arn = aws_lb.alb.arn
#   port              = 443
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"
#   certificate_arn   = var.certificate_arn

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.web_tg.arn
#   }

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.mobile_tg.arn
#   }

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.eks_tg.arn
#   }
# }
