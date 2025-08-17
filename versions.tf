terraform {
  # required_version = "value"

  # required_providers {
  #   aws = {
  #       source = "hashicorp/aws"
  #       version = "= 5.0"

  #   }
  # }
  backend "s3" {
    bucket         = "my-prod-terraform-state-bucket-0000"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile = true
  }
}

