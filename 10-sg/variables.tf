variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "sg_names" {
  type = list
  default = [
    # Databases
    "mongodb", "redis", "mysql", "rabbitmq",

    # Backend
    "catalogue", "cart", "user", "payment", "shipping",
    "backend_alb",

    # Frontend  
    "frontend",
    "frontend_alb",
    "bastion"
  ]
}