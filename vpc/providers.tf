terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.52.0"
    }
  }

  backend "s3" {

    bucket = "statefile-2837468723"
    key = "terraform.tfstate"
    dynamodb_table = "state-lock-saurabh"
    region = "us-east-1"
  }
}

provider "aws" {
  # Configuration options

  region = "us-east-1"
}