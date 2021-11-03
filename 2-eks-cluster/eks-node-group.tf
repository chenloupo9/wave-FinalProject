resource "aws_eks_node_group" "eks_cluster_nodegroup_spot" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "eks_cluster_nodegroup_spot"
  node_role_arn   = aws_iam_role.eks_cluster_worker_role.arn
  capacity_type   = "SPOT"
  subnet_ids      = [ 
    aws_subnet.main-private-1.id,
    aws_subnet.main-private-2.id,
  ]
 
  scaling_config {
    desired_size  = 2
    max_size      = 10
    min_size      = 1
  }
  
  ami_type             = "AL2_x86_64" 
  disk_size            = "8" 
  instance_types       = ["t3.small", "t3.medium"]
  force_update_version = false 
  version              = "1.21"

  labels = {
    type_of_nodegroup = "spot"
  

  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_attach_policy_to_worker_role
  ]
}
