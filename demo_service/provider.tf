provider "aws" {
  region  = "us-east-1"
}
terraform {
  backend "s3" {
    bucket         = "4c2cdad2-demo-tf-state"
    key            = "demo-state.tf"
    region         = "us-east-1"
  }
}