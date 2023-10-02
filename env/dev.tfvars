# Remote State
tf_state_bucket_name = "sca-s3-tf-remote-state-us-east-1-002"
# EC2
ec2_key_name                        = "sca-key-ec2-demo-us-east-1b"
ec2_key_path                        = "keypair/ec2.pub"
ec2_security_group_name             = "sca-sg-ec2-demo-us-east-1b"
ec2_security_group_name_description = "This is an example security group"
ec2_name                            = "sca-ec2-demo-us-east-1b"
ec2_instance_type                   = "t2.micro"
ec2_vpcs                            = ["sca-vpc-demo-network-us-east-1-001"]
ec2_subnets                         = ["sca-vpc-demo-network-us-east-1-001-public-us-east-1b"]