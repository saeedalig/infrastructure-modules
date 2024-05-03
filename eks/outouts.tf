
# EKS Name
output "eks_name" {
  value = aws_eks_cluster.this.name
}

# OIDC provider arn
output "openid_provider_arn" {
  value = aws_iam_openid_connect_provider.this[0].arn
}