output "aws_public_subnet" {
  value = aws_subnet.public_aws-eks_subnet.*.id
}

output "vpc_id" {
  value = aws_vpc.aws-eks.id
}