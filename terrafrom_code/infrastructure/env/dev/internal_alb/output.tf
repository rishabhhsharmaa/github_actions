output "internal_alb_sg_id" {
  value = module.internal_alb_security_group.sg_id
}

output "internal_alb_arn" {
  value = module.internal_alb.alb_arn
}

output "target_group_ui_arn" {
  value = aws_lb_target_group.management-bp-ui-tg-int-alb.arn
}

output "target_group_api_arn" {
  value = aws_lb_target_group.management-bp-api-tg-int-alb.arn
}