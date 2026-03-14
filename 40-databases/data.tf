data "aws_ami" "joindevops" { #to get the information from provider, we can use data sources
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ssm_parameter" "database_subnet_ids"{
    name = "/${var.project}/${var.environment}/private_subnet_ids" # Database should be in private subnets
}

data "aws_ssm_parameter" "mongodb_sg_id"{
    name = "/${var.project}/${var.environment}/bastion_sg_id" # 2 subnet's we created
}