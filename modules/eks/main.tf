resource "aws_eks_cluster" "aws-eks" {
  name     = var.cluster_name
  role_arn = var.aws_iam_role_cluster_arn

  vpc_config {
    subnet_ids              = var.aws_public_subnet
    endpoint_public_access  = var.endpoint_public_access
    endpoint_private_access = var.endpoint_private_access
    public_access_cidrs     = var.public_access_cidrs
    security_group_ids      = [var.security_group_id]
  }

  depends_on = [
    var.AmazonEKSClusterPolicy,
    var.AmazonEKSVPCResourceController,
  ]
}

resource "aws_eks_node_group" "aws-eks" {
  cluster_name    = aws_eks_cluster.aws-eks.name
  node_group_name = var.node_group_name
  node_role_arn   = var.aws_iam_role_node_arn
  subnet_ids      = var.aws_public_subnet
  instance_types  = var.instance_types

  remote_access {
    source_security_group_ids = [var.security_group_id]
    ec2_ssh_key               = var.key_pair
  }

  scaling_config {
    desired_size = var.scaling_desired_size
    max_size     = var.scaling_max_size
    min_size     = var.scaling_min_size
  }

  depends_on = [
    var.AmazonEKSWorkerNodePolicy,
    var.aws-eks-AmazonEKS_CNI_Policy,
    var.aws-eks-AmazonEC2ContainerRegistryReadOnly,
  ]
}