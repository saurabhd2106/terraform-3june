terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.52.0"
    }
  }
}

provider "aws" {
  # Configuration options

  region = "us-east-1"
}

provider "aws" {
  # Configuration options

  alias = "useast2"

  region = "us-east-2"
}