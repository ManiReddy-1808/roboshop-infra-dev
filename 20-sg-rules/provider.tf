terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.33.0" # Terraform AWS provider version
    }
  }

  backend "s3" { # S3 backend configuration for remote state storage
  bucket  = "dev-remote-state-terraform" 
  key     = "roboshop-dev-sg-rules.tfstate" # The path within the bucket where the state file will be stored in s3.
  region  = "us-east-1"
  encrypt = true
  use_lockfile   = true # Enable state locking to prevent concurrent modifications
  }
}

provider "aws" {
  region = "us-east-1" # Specify your desired AWS region
}