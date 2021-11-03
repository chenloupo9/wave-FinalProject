# create an eks-cluster-role
resource "aws_iam_role" "eks_cluster_role" {
  name = "eks_cluster_role"
  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "eks.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF
}

# eks-cluster-policy
data "aws_iam_policy" "eks_cluster_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# attach eks-policy to eks-cluster-role
resource "aws_iam_role_policy_attachment" "eks_cluster_attach_policy_to_role" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = data.aws_iam_policy.eks_cluster_policy.arn
}



