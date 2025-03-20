output "eks_sg_id" {
  description = "EKS Security Group ID"
  value       = aws_security_group.eks_sg.id
}

output "eks_sg_arn" {
  description = "EKS Security Group ARN"
  value       = aws_security_group.eks_sg.arn
}

output "eks_security_group_id" {
  description = "The ID of the EKS security group"
  value       = aws_security_group.eks_sg.id
}

