module "sg" {
  source = "../../terraform-aws-sg"
  project = var.project
  environment = var.environment
  sg_name = var.sg_name
  vpc_id = local.vpc_id
}