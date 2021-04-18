output "eks_status" {
    value = aws_eks_cluster.devCluster.status
}

output "eks_arn" {
  value = aws_eks_cluster.devCluster.arn
}