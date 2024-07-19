output "ec2_id" {
  description = "The ID of the instance"
  value       = try(aws_instance.this.id, "")
}

output "arn" {
  description = "The ARN of the instance"
  value       = try(aws_instance.this.arn, "")
}

output "ec2_private_ip" {
  description = "The private IP address assigned to the instance."
  value       = try(aws_instance.this.private_ip, "")
}