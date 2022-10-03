output "frontend_sg_id" {
  value = module.frontend_security_group.sg_id
}

output "app-ssh-key" {
  value = aws_key_pair.app-pem.key_name
}