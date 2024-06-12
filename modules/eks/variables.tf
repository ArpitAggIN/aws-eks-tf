variable "aws_public_subnet" {
    description = "public subnet"
}

variable "cluster_name" {
    description = "name of the aws cluster"
}

variable "endpoint_private_access" {
    description = "bool value to enable private access for cluster"
}

variable "endpoint_public_access" {
    description = "bool value to enable public access for cluster"
}

variable "public_access_cidrs" {
    description = "cidr range for cluster's public access "
}

variable "node_group_name" {
    description = "node group name"
}

variable "scaling_desired_size" {
    description = "node group desired size for number of nodes"
}

variable "scaling_max_size" {
    description = "node group maximum value of nodes in cluster"
}

variable "scaling_min_size" {
    description = "node group minimum value of nodes required in cluster"
}

variable "instance_types" {
    description = "type of instance"
}

variable "key_pair" {
    description = "rsa key pair in aws for access"
}

variable "aws_iam_role_cluster_arn" {
    description = "cluster iam role arn"
}

variable "aws_iam_role_node_arn" {
    description = "node iam role arn"
}

variable "security_group_id" {
    description = "node group security group id"
}

variable "AmazonEKSClusterPolicy" {
  description = "EKS cluster policy attachment to iam role "
}

variable "AmazonEKSVPCResourceController" {
  description = "vpc resource controller policy attachment to iam role"
}

variable "AmazonEKSWorkerNodePolicy" {
  description = "EKS worker node policy attachment to iam role"
}

variable "aws-eks-AmazonEKS_CNI_Policy" {
  description = "CNI policy attachment to iam role"
}

variable "aws-eks-AmazonEC2ContainerRegistryReadOnly" {
  description = "EC2 container registry policy attachment to iam role"
}