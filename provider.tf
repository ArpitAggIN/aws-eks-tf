terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.15.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }

  }

backend "s3" {
    bucket         = "aws-eks-test-bucket-me"
    key            = "state/terraform.aws_eks_tf_state_me"
    region         = "me-central-1"
    dynamodb_table = "tf-state-lock-db"
    skip_region_validation = true
  }
}

provider "aws" {
  region = "eu-north-1"
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}
data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
provider "kubernetes" {
  cluster_ca_certificate = base64decode(module.eks.kubeconfig-certificate-authority-data)
  host                   = data.aws_eks_cluster.cluster.endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token

}

resource "random_string" "suffix" {
  length  = 5
  special = false
}