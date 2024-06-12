Terraform code using modules to privision EKS cluster, node groups, VPC, security groups and IAM roles and policy attachments on AWS.
Required to create the simple infrastructure to deploy and run applications across the AWS EKS.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) (latest)
- [AWS CLI](https://aws.amazon.com/cli/) (latest)
- AWS account with read and write permissions to create EKS, VPC, ECR, S3, EC2 and IAM resources
- Generate access key and secret key for that account to be used for configuring aws credentials
- For this project we will be using aws region eu-north-1


## Usage

### Clone the Repository

```sh
git clone https://github.com/ArpitAggIN/aws-eks-tf.git
cd aws-eks-tf
```

### Configure AWS credentials (e.g., `~/.aws/credentials`)
```sh
aws configure
```

### Create key pair for the EC2 instances to be used by the node group in EKS
```sh
aws ec2 create-key-pair \
    --key-name TestKeyPair \
    --key-type rsa \
    --key-format pem \
    --output text > TestKeyPair.pem
```

### Create ECR in the same region for the images to be stored
```sh
aws ecr create-repository \
    --repository-name java-eks \
    --region eu-north-1 \
```

### Initialize Terraform and provision S3 bucket for terraform backend
```sh 
cd remote-state
terraform init
terraform plan
terraform apply -auto-approve
cd ..
```

### Intialize Terraform to provision EKS Infra
```sh
terraform init
terraform plan
terraform apply -auto-approve
```

Check for all the resources created in AWS










