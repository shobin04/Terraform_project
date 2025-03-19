output "cluster_id" {
  description = "The EKS cluster ID"
  value       = aws_eks_cluster.cluster.id
}

output "cluster_endpoint" {
  description = "The endpoint for the EKS cluster"
  value       = aws_eks_cluster.cluster.endpoint
}

output "cluster_version" {
  description = "The Kubernetes version for the cluster"
  value       = aws_eks_cluster.cluster.version
}

output "node_group_arn" {
  description = "ARN of the worker node group"
  value       = aws_eks_node_group.worker_group.arn
}
