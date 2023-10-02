module "ec2_key_pair" {
  source     = "terraform-aws-modules/key-pair/aws"
  key_name   = var.ec2_key_name
  public_key = file(var.ec2_key_path)
}

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

module "ec2_instance" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  name                        = var.ec2_name
  instance_type               = var.ec2_instance_type
  key_name                    = module.ec2_key_pair.key_pair_name
  vpc_security_group_ids      = [module.ec2_sg.security_group_id]
  subnet_id                   = data.aws_subnet.pub_subnet.id
  associate_public_ip_address = true
}