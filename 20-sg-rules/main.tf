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

resource "aws_security_group_rule" "redis_user"{
    type = "ingress"
    from_port = 6379
    to_port = 6379
    protocol = "tcp"
    source_security_group_id = local.user_sg_id
    security_group_id = local.redis_sg_id
}

resource "aws_security_group_rule" "redis_cart"{
    type = "ingress"
    from_port = 6379
    to_port = 6379
    protocol = "tcp"
    source_security_group_id = local.cart_sg_id 
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

resource "aws_security_group_rule" "mysql_shipping"{
    type = "ingress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    source_security_group_id = local.shipping_sg_id
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

resource "aws_security_group_rule" "rabbit_payment"{
    type = "ingress"
    from_port = 5672
    to_port = 5672
    protocol = "tcp"
    source_security_group_id = local.payment_sg_id
    security_group_id = local.rabbitmq_sg_id
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

# Catalogue accepting connections form Backend_ALB
resource "aws_security_group_rule" "catalogue_backend_alb"{
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    source_security_group_id = local.backend_alb_sg_id # Where traffic is coming from
    security_group_id = local.catalogue_sg_id
}

# User accepting connections form Bastion
resource "aws_security_group_rule" "user_bastion"{
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = local.bastion_sg_id
    security_group_id = local.user_sg_id
}

resource "aws_security_group_rule" "user_backend_alb"{
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    source_security_group_id = local.backend_alb_sg_id 
    security_group_id = local.user_sg_id
}


# Cart accepting connections form Bastion
resource "aws_security_group_rule" "cart_bastion"{
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = local.bastion_sg_id
    security_group_id = local.cart_sg_id
}

resource "aws_security_group_rule" "cart_backend_alb"{
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    source_security_group_id = local.backend_alb_sg_id 
    security_group_id = local.cart_sg_id
}


# Shipping accepting connections form Bastion
resource "aws_security_group_rule" "shipping_bastion"{
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = local.bastion_sg_id
    security_group_id = local.shipping_sg_id
}

resource "aws_security_group_rule" "shipping_backend_alb"{
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    source_security_group_id = local.backend_alb_sg_id 
    security_group_id = local.shipping_sg_id
}

# Payment accepting connections form Bastion
resource "aws_security_group_rule" "payment_bastion"{
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    source_security_group_id = local.bastion_sg_id
    security_group_id = local.payment_sg_id
}

resource "aws_security_group_rule" "payment_backend_alb"{
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    source_security_group_id = local.backend_alb_sg_id 
    security_group_id = local.payment_sg_id
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

resource "aws_security_group_rule" "backend_alb_catalogue"{
    type = "ingress"
    from_port = 80 # 22 will not give access to backend ALB by AWS.
    to_port = 80 
    protocol = "tcp"
    source_security_group_id = local.catalogue_sg_id
    security_group_id = local.backend_alb_sg_id
}

resource "aws_security_group_rule" "backend_alb_user"{
    type = "ingress"
    from_port = 80 # 22 will not give access to backend ALB by AWS.
    to_port = 80 
    protocol = "tcp"
    source_security_group_id = local.user_sg_id
    security_group_id = local.backend_alb_sg_id
}

resource "aws_security_group_rule" "backend_alb_cart"{
    type = "ingress"
    from_port = 80 # 22 will not give access to backend ALB by AWS.
    to_port = 80 
    protocol = "tcp"
    source_security_group_id = local.cart_sg_id
    security_group_id = local.backend_alb_sg_id
}

resource "aws_security_group_rule" "backend_alb_shipping"{
    type = "ingress"
    from_port = 80 # 22 will not give access to backend ALB by AWS.
    to_port = 80 
    protocol = "tcp"
    source_security_group_id = local.shipping_sg_id
    security_group_id = local.backend_alb_sg_id
}

resource "aws_security_group_rule" "backend_alb_payment"{
    type = "ingress"
    from_port = 80 # 22 will not give access to backend ALB by AWS.
    to_port = 80 
    protocol = "tcp"
    source_security_group_id = local.payment_sg_id
    security_group_id = local.backend_alb_sg_id
}

resource "aws_security_group_rule" "backend_alb_frontend"{
    type = "ingress"
    from_port = 80 
    to_port = 80 
    protocol = "tcp"
    source_security_group_id = local.frontend_sg_id
    security_group_id = local.backend_alb_sg_id
}

# Frontend accepting connections from Frontend_ALB
resource "aws_security_group_rule" "frontend_frontend_alb"{
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    source_security_group_id = local.frontend_alb_sg_id
    security_group_id = local.frontend_sg_id
}

resource "aws_security_group_rule" "frontend_alb_public"{
    type = "ingress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Where traffic is coming from
    security_group_id = local.frontend_alb_sg_id
}