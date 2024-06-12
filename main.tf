module "eks" {
  source                                     = "./modules/eks"
  aws_public_subnet                          = module.vpc.aws_public_subnet
  cluster_name                               = var.cluster_name
  endpoint_public_access                     = var.cluster_endpoint_public_access
  endpoint_private_access                    = var.cluster_endpoint_private_access
  public_access_cidrs                        = var.public_access_cidrs
  node_group_name                            = var.node_group_name
  scaling_desired_size                       = var.desired_capacity
  scaling_max_size                           = var.max_capacity
  scaling_min_size                           = var.min_capacity
  instance_types                             = var.eks_node_group_instance_type
  key_pair                                   = var.key_pair
  aws_iam_role_cluster_arn                   = module.iam.aws_iam_role_cluster_arn
  aws_iam_role_node_arn                      = module.iam.aws_iam_role_node_arn
  security_group_id                          = module.security-group.security_group_id
  AmazonEKSClusterPolicy                     = module.iam.AmazonEKSClusterPolicy
  AmazonEKSVPCResourceController             = module.iam.AmazonEKSVPCResourceController
  AmazonEKSWorkerNodePolicy                  = module.iam.AmazonEKSWorkerNodePolicy
  aws-eks-AmazonEKS_CNI_Policy               = module.iam.aws-eks-AmazonEKS_CNI_Policy
  aws-eks-AmazonEC2ContainerRegistryReadOnly = module.iam.aws-eks-AmazonEC2ContainerRegistryReadOnly
}

module "iam" {
  source = "./modules/iam"
}

module "security-group" {
  source          = "./modules/security-group"
  vpc_id          = module.vpc.vpc_id
  sg_ingress_cidr = var.sg_ingress_cidr
  sg_egress_cidr = var.sg_egress_cidr
}

module "vpc" {
  source                  = "./modules/vpc"
  tags                    = var.vpc_tag
  instance_tenancy        = "default"
  vpc_cidr                = var.vpc_cidr
  access_ip               = var.access_ip
  public_sn_count         = 2
  public_cidrs            = var.public_subnet_cidrs
  map_public_ip_on_launch = var.map_public_ip_on_launch
  rt_route_cidr_block     = var.route_table_cidr_block
}