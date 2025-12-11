terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.26.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "random_id" "id" {
    byte_length = 8
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = "TerraformEC2 - ${random_id.id.dec}"
  }
}
