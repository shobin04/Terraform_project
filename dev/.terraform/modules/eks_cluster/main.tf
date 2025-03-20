resource "aws_eks_cluster" "cluster" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn
  version  = var.k8s_version

  vpc_config {
    subnet_ids                   = var.eks_subnet_ids
    endpoint_private_access       = true
    endpoint_public_access        = false
    public_access_cidrs           = []
    security_group_ids            = [var.eks_security_group_id]
  }

  tags = var.tags
}

resource "aws_eks_node_group" "worker_group" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "${var.cluster_name}-node-group"
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.eks_subnet_ids
  instance_types  = var.eks_instance_types

  scaling_config {
    desired_size = var.desired_capacity
    max_size     = var.max_capacity
    min_size     = var.min_capacity
  }

  tags = merge(
    var.tags,
    {
      "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    }
  )
}
