# Bastion accepting connections from Internet
resource "aws_security_group_rule" "bastion_internet"{  
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # --> This OR source_security_group (NOT BOTH)
    security_group_id = local.bastion_sg_id
}


# MongoDB accepting connections form Bastion
resource "aws_security_group_rule" "mongodb_bastion"{
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = local.bastion_sg_id # Where traffic is coming from
    security_group_id = local.mongodb_sg_id
}

resource "aws_security_group_rule" "mongodb_catalogue"{
    type = "ingress"
    from_port = 27017
    to_port = 27017
    protocol = "tcp"
    source_security_group_id = local.catalogue_sg_id 
    security_group_id = local.mongodb_sg_id
}

resource "aws_security_group_rule" "mongodb_user"{
    type = "ingress"
    from_port = 27017
    to_port = 27017
    protocol = "tcp"
    source_security_group_id = local.user_sg_id 
    security_group_id = local.mongodb_sg_id
}


# Redis accepting connections form Bastion
resource "aws_security_group_rule" "redis_bastion"{
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = local.bastion_sg_id # Where traffic is coming from
    security_group_id = local.redis_sg_id
}


# Mysql accepting connections form Bastion
resource "aws_security_group_rule" "mysql_bastion"{
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = local.bastion_sg_id # Where traffic is coming from
    security_group_id = local.mysql_sg_id
}


# RabbitMQ accepting connections form Bastion
resource "aws_security_group_rule" "rabbit_bastion"{
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = local.bastion_sg_id # Where traffic is coming from
    security_group_id = local.rabbitmq_sg_id
}

# BackendALB accepting connections form Bastion
resource "aws_security_group_rule" "backend_alb_bastion"{
    type = "ingress"
    from_port = 80 # 22 will not give access to backend ALB by AWS.
    to_port = 80 
    protocol = "tcp"
    source_security_group_id = local.bastion_sg_id # Where traffic is coming from
    security_group_id = local.backend_alb_sg_id
}

# Catalogue accepting connections form Bastion
resource "aws_security_group_rule" "catalogue_bastion"{
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = local.bastion_sg_id # Where traffic is coming from
    security_group_id = local.catalogue_sg_id
}

# Catalogue accepting connections form Bastion
resource "aws_security_group_rule" "catalogue_backend_alb"{
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    source_security_group_id = local.backend_alb_sg_id # Where traffic is coming from
    security_group_id = local.catalogue_sg_id
}