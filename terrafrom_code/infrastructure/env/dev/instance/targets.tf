resource "aws_lb_target_group_attachment" "foo" {
  target_group_arn = data.terraform_remote_state.internal_alb.outputs.target_group_api_arn
  target_id        = module.project_instance.instance_id[0]
  port             = 9001
}

resource "aws_lb_target_group_attachment" "baar" {
  target_group_arn = data.terraform_remote_state.internal_alb.outputs.target_group_ui_arn
  target_id        = module.project_instance.instance_id[0]
  port             = 80
}