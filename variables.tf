variable "tf_state_bucket_name" {
  description = "The name of the tf remote state bucket"
  type        = string
}

variable "ec2_key_name" {
  description = "The name of the key pair"
  type        = string
}

variable "ec2_key_path" {
  description = "The path to the public key used to access EC2 instances"
  type        = string
}

variable "ec2_security_group_name" {
  description = "The name of the security group"
  type        = string
}

variable "ec2_security_group_name_description" {
  description = "The description of the security group"
  type        = string
}

variable "ec2_name" {
  description = "The name of the EC2 instance"
  type        = string
}

variable "ec2_instance_type" {
  description = "The instance type of the EC2 instance"
  type        = string
}

variable "ec2_vpcs" {
  description = "The VPCs to filter"
  type        = list(string)
}

variable "ec2_subnets" {
  description = "The subnets to filter"
  type        = list(string)
}