#We are using aws_alb resource because we want to use ALB specific features like path-based routing, host-based routing, etc.
resource "aws_alb" "backend_alb" { 
  name = "${var.project}-${var.environment}"
  internal = true
  load_balancer_type = "application"
  security_groups = [local.backend_alb_sg_id]
  subnets = local.private_subnet_ids

  enable_deletion_protection = false # Keep it false. Just to delete bt terraform

  tags = merge(
    {
        Name = "${var.project}-${var.environment}"
    },
    local.common_tags
  )
}

resource "aws_lb_listener" "http" { # Use aws_lb_listener instead of aws_alb_listener because we are using aws_alb resource
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Hi, I am from HTTP Backend ALB</h1>"
      status_code  = "200"
    }
  }
}

resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  name    = "*.backend-alb-${var.environment}.${var.domain_name}"
  type    = "A"
  
  # LB details are dynamic. So we need to use alias record instead of IP address.
  alias {
    name                   = aws_lb.backend_alb.dns_name # These are LB details.
    zone_id                = aws_lb.backend_alb.zone_id
    evaluate_target_health = true
  }
}