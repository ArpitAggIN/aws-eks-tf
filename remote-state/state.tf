provider "aws" {
  region = "me-central-1"
}

resource "aws_s3_bucket" "aws_eks_tf_state_me" {
  bucket = "aws-eks-test-bucket-me"
     
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "aws_eks_tf_state_me" {
    bucket = aws_s3_bucket.aws_eks_tf_state_me.id

    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_dynamodb_table" "aws_eks_tf_state_me_lock" {
  name           = "tf-state-lock-db"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}