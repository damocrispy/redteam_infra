terraform {
  required_version = "~> 1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.43"
    }
  }

  backend "s3" {
    bucket = "terraform-state-572f094e39"
    key    = "terraform.state"
    region = "eu-west-1"
  }

}
