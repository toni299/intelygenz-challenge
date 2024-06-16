module "rds" {
  source  = "terraform-aws-modules/rds-aurora/aws"

  name                    = "http-server-challenge"
  engine                  = "mysql"
  instance_class          = "db.t2.micro"
  vpc_id                  = var.vpc_id
  db_subnet_group_name    = var.database_subnet_group_name
  instances               = { 1 = {} }
  master_username         = "root"
  apply_immediately       = true
  storage_encrypted       = true
  skip_final_snapshot     = true
  backup_retention_period = 1
}

variable "vpc_id" {
  type        = string
}

variable "database_subnet_group_name" {
  type        = string
}

variable "security_group_ids" {
  type        = list(string)
}