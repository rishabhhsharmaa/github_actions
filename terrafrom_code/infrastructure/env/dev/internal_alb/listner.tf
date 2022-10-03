resource "aws_lb_target_group" "dev-api-tg-int-alb" {
  name        = "dev-api-tg-int-alb"
  port        = 9001
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id
  health_check {
    protocol            = "HTTP"
    healthy_threshold   = 5
    path                = "/api/v1/default/health/"
    interval            = 30
    timeout             = 5
    unhealthy_threshold = 2
    enabled             = true
  }
}

resource "aws_lb_target_group" "dev-ui-tg-int-alb" {
  name        = "dev-ui-tg-int-alb"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id
  health_check {
    protocol            = "HTTP"
    healthy_threshold   = 5
    path                = "/"
    interval            = 30
    timeout             = 5
    unhealthy_threshold = 2
    enabled             = true
  }
}


resource "aws_lb_listener_rule" "static" {
  listener_arn = module.internal_alb.alb_https_listener_arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.dev-api-tg-int-alb.arn
  }

  condition {
    host_header {
      values = ["test_one.com"]
    }
  }
}

resource "aws_alb_listener_rule" "static2" {
  listener_arn = module.internal_alb.alb_https_listener_arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.dev-ui-tg-int-alb.arn
  }

  condition {
    host_header {
      values = ["test_two.com"]
    }
  }
}