resource "aws_security_group" "sg_a" {
  vpc_id = var.vpc_id
  name   = "http-server-challenge-a"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "http-server-challenge-a"
  }
}

resource "aws_security_group" "sg_b" {
  vpc_id = var.vpc_id
  name   = "http-server-challenge-b"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "http-server-challenge-b"
  }
}

resource "aws_security_group" "sg_c" {
  vpc_id = var.vpc_id
  name   = "http-server-challenge-c"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "http-server-challenge-c"
  }
}

output "sg_a_id" {
  value = aws_security_group.sg_a.id
}

output "sg_b_id" {
  value = aws_security_group.sg_b.id
}

output "sg_c_id" {
  value = aws_security_group.sg_c.id
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}