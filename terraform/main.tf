resource "aws_eks_cluster" "eks_cluster" {
  name = "webapp"  # Your desired cluster name
  role_arn = aws_iam_role.eks_role.arn
  vpc_config {
    subnet_ids = ["subnet-045c88b1bac827cfd", "subnet-09d156411fc809c1d"]
  }

  depends_on = [aws_iam_role.eks_role, aws_iam_role_policy_attachment.eks_policy_attachment]
}

resource "aws_iam_role" "eks_role" {
  name = "eks-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        "Service": [
                    "eks.amazonaws.com",
                    "ec2.amazonaws.com"
                ]
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "eks_role_policy" {
  name = "eks-role-policy"
  role = aws_iam_role.eks_role.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "*"
      Effect = "Allow"
      Resource = "*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "eks_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_role.name
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "webapp-node-group"  # node group name
  node_role_arn   = aws_iam_role.eks_role.arn
  subnet_ids      = ["subnet-045c88b1bac827cfd", "subnet-09d156411fc809c1d"]  # subnets
  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
  instance_types = ["t3.medium"]
}