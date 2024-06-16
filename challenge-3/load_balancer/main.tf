module "nlb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.7.0"

  name               = "http-server-challenge"
  load_balancer_type = "network"
  vpc_id             = var.vpc_id
  subnets            = var.public_subnets

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "TCP_UDP"
      target_group_index = 0
    },
  ]

  target_groups = [
    {
      name_prefix            = "tg-"
      backend_protocol       = "TCP_UDP"
      backend_port           = 80
      target_type            = "instance"
      tags = {
        tcp_udp = true
      }
      health_check = {
        enabled             = true
        protocol            = "HTTP"
        path                = "/"
        port                = "80"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 5
        unhealthy_threshold = 2
        matcher             = "200"
      }
    },
  ]

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name = "http-server-challenge"
  }
}


output "nlb_arn" {
  value = module.nlb.lb_arn
}

output "nlb_dns_name" {
  value = module.nlb.lb_dns_name
}

output "nlb_target_group_arn" {
  value = module.nlb.target_group_arns[0]
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnets" {
  description = "A list of public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of public subnets"
  type        = list(string)
}
