module "vpc" {
  source = "../../terraform-aws-vpc" # Path to local module
  project = var.project # Passing mandatory variables
  environment = var.environment
  is_peering_required = true
}
