data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = var.ec2_vpcs
  }
}

data "aws_subnet" "pub_subnet" {
  filter {
    name   = "tag:Name"
    values = var.ec2_subnets
  }
}