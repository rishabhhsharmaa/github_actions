output "ecr_repository_arn" {
  value       = aws_ecr_repository.ecr_new.*.arn
  description = "Full ARN of the repository."
}

output "ecr_repository_name" {
  value       = aws_ecr_repository.ecr_new.*.name
  description = "The name of the repository."
}

output "ecr_repository_registry_id" {
  value       = aws_ecr_repository.ecr_new.*.registry_id
  description = "The registry ID where the repository was created."
}

output "ecr_repository_url" {
  value       = aws_ecr_repository.ecr_new.*.repository_url
  description = "The URL of the repository (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)"
}
