module "sg" {
  count = length(var.sg_names)
  source = "git::https://github.com/ManiReddy-1808/terraform-aws-sg.git?ref=main"
  project = var.project
  environment = var.environment
  sg_name = replace(var.sg_names[count.index], "_", "-")
  vpc_id = local.vpc_id
}