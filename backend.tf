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

# This provider is required for WAF for CloudFront:
# https://docs.aws.amazon.com/waf/latest/developerguide/how-aws-waf-works-resources.html
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}
