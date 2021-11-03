# create EKS-cluster
resource "aws_eks_cluster" "cluster" {
  name     = "eks_cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = "1.21"
  vpc_config {
    subnet_ids = [ 
      aws_subnet.main-private-1.id, 
      aws_subnet.main-private-2.id,
      aws_subnet.main-public-1.id, 
      aws_subnet.main-public-2.id
    ] 
  }
  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_attach_policy_to_role
  ]
}
