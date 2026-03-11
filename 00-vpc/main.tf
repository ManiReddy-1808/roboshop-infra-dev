module "vpc" {
  source = "git::https://github.com/ManiReddy-1808/terraform-aws-vpc.git?ref=main" # Path to local module
  project = var.project # Passing mandatory variables
  environment = var.environment
  is_peering_required = true
}
