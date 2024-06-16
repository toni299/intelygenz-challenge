data "aws_ssm_parameter" "amzn2_latest" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_launch_template" "default" {
  name_prefix   = "http-server-challenge"
  image_id      = data.aws_ssm_parameter.amzn2_latest.value
  instance_type = "t3.micro"

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.sg_a_id, var.sg_b_id, var.sg_c_id]
  }


  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Hello World" > /var/www/html/index.html
              EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "http-server-challenge"
    }
  }
}

resource "aws_autoscaling_group" "this" {
  desired_capacity     = 3
  max_size             = 3
  min_size             = 3
  vpc_zone_identifier  = var.public_subnets
  target_group_arns    = [var.target_group_arn]
  health_check_type    = "EC2"

  launch_template {
    id      = aws_launch_template.default.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "http-server-challenge"
    propagate_at_launch = true
  }
}

variable "public_subnets" {
  description = "A list of public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of private subnets"
  type        = list(string)
}

variable "target_group_arn" {
  description = "The ARN of the target group"
  type        = string
}

variable "sg_a_id" {
  description = "ID of the security group A"
  type        = string
}

variable "sg_b_id" {
  description = "ID of the security group B"
  type        = string
}

variable "sg_c_id" {
  description = "ID of the security group C"
  type        = string
}