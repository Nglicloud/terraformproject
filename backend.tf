terraform {
  backend "s3" {
    bucket         = "my-terraf-state-bucket"
    key            = "ec2/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table"
  }
}
