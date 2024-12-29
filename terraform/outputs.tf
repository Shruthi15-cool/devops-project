# Output the EKS Cluster Name
output "eks_cluster_name" {
  description = "The name of the EKS cluster."
  value       = aws_eks_cluster.eks_cluster.name
}

# Output the EKS Cluster Endpoint
output "eks_cluster_endpoint" {
  description = "The endpoint of the EKS cluster."
  value       = aws_eks_cluster.eks_cluster.endpoint
}

# Output the EKS Cluster ARN
output "eks_cluster_arn" {
  description = "The ARN of the EKS cluster."
  value       = aws_eks_cluster.eks_cluster.arn
}

# Output the EKS Cluster Certificate Authority Data
output "eks_cluster_certificate_authority_data" {
  description = "The certificate authority data for the EKS cluster."
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

# Output the Subnet IDs used for the EKS Cluster
output "eks_cluster_subnet_ids" {
  description = "The subnet IDs used by the EKS cluster."
  value       = aws_eks_cluster.eks_cluster.vpc_config[0].subnet_ids
}

# Output the Node Group Name
output "eks_node_group_name" {
  description = "The name of the EKS node group."
  value       = aws_eks_node_group.eks_node_group.node_group_name
}

# Output the Node Group Instance Types
output "eks_node_group_instance_types" {
  description = "The instance types of the EKS node group."
  value       = aws_eks_node_group.eks_node_group.instance_types
}

