## variables for AWS cluster

variable "cluster_name" {
  description = "The name of the EKS cluster."
  default     = "aws-eks"
}

variable "node_group_name" {
  description = "The name of the EKS node group."
  default     = "aws-eks"
}

variable "eks_node_group_instance_type" {
  description = "The instance type for the EKS node group."
  type = list(string)
  default = [ "t3.medium" ]
}

variable "desired_capacity" {
  description = "The desired number of nodes in the node group."
  default     = 1
}

variable "max_capacity" {
  description = "The maximum number of nodes in the node group."
  default     = 2
}

variable "min_capacity" {
  description = "The minimum number of nodes in the node group."
  default     = 1
}

variable "cluster_endpoint_public_access" {
  type        = bool
  default     = "true"
}

variable "cluster_endpoint_private_access" {
  type        = bool
  default     = "true"
}

variable "key_pair" {
  default = "TestKeyPair"
}


## variables for AWS VPC

variable "route_table_cidr_block" {
    default = "0.0.0.0/0"
}

variable "sg_egress_cidr" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_ingress_cidr" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "public_access_cidrs" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "enable_public_ip" {
  type        = bool
  default     = "true"
}

variable "vpc_tag" {
  default     = "aws-eks"
}

variable "access_ip" {
    default = "0.0.0.0/0"
}

variable "map_public_ip_on_launch" {
    type = bool
    default = true 
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "default CIDR range of the VPC"
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDR blocks."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}