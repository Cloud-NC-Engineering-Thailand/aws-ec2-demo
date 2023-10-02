module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  bucket = var.tf_state_bucket_name
}