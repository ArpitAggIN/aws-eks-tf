variable "vpc_id" {
  description = "vpc id"
}

variable "sg_ingress_cidr" {
  description = "cidr range for the ingress rules of security group"
}

variable "sg_egress_cidr" {
  description = "cidr range for the egress rules of security group"
}