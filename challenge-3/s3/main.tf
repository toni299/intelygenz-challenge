module "s3" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  bucket  = "http-server-challenge"
  tags = {
    env = "challenge"
    Name = "http-server-challenge"
  }
}

