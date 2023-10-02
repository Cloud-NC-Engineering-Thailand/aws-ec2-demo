# EC2 AWS Infrastructure Setup Using Terraform

This repository contains Terraform modules to set up an AWS infrastructure including EC2 instances, security groups, and key pairs. Below are the details of each module and the resources they manage.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Resources](#resources)
  - [EC2 Key Pair](#ec2-key-pair)
  - [EC2 Security Group](#ec2-security-group)
  - [EC2 Instance](#ec2-instance)
- [Usage](#usage)

## Prerequisites
- Terraform v1.5.7 or newer.
- AWS CLI configured with the necessary credentials.
- Appropriate IAM permissions to create and manage the specified resources.

## Resources

### EC2 Key Pair

This module creates an EC2 key pair which is essential for SSH access to the EC2 instances.

```hcl
module "ec2_key_pair" {
  source = "terraform-aws-modules/key-pair/aws"
  key_name   = var.ec2_key_name
  public_key = file(var.ec2_key_path)
}
```

### EC2 Security Group

This module creates a security group with a rule that allows SSH access to the EC2 instances.

```hcl
module "ec2_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = var.ec2_security_group_name
  description = var.ec2_security_group_name_description
  vpc_id      = data.aws_vpc.vpc.id
  ingress_with_cidr_blocks = [
    {
      rule        = "ssh-tcp"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "Allow all traffic to ssh on port 22"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}
```

### EC2 Instance

This module creates an EC2 instance with the specified instance type, key pair, and security group.

```hcl
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = var.ec2_name
  instance_type          = var.ec2_instance_type
  key_name               = module.ec2_key_pair.key_pair_name
  vpc_security_group_ids = [module.ec2_sg.security_group_id]
  subnet_id              = data.aws_subnet.pub_subnet.id
  associate_public_ip_address = true
}
```

## Usage
1. Clone the repository to your local machine.
2. Navigate to the directory containing the Terraform configuration such as "aws-ec2-demo".
3. Initialize the Terraform configuration by running:

```bash
$ terraform init
```

4. Apply the Terraform configuration to AWS by running:

```bash
$ terraform apply -var-file=env/dev.tfvars
```