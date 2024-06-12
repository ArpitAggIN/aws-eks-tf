output "aws_iam_role_cluster_arn" {
  value = aws_iam_role.aws-eks.arn
}

output "aws_iam_role_node_arn" {
    value = aws_iam_role.aws-eks2.arn
}

output "AmazonEKSClusterPolicy" {
  value = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

output "AmazonEKSVPCResourceController" {
    value = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
}

output "AmazonEKSWorkerNodePolicy" {
    value = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy" 
}

output "aws-eks-AmazonEKS_CNI_Policy" {
    value = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

output "aws-eks-AmazonEC2ContainerRegistryReadOnly" {
    value = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly" 
}