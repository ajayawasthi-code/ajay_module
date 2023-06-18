resource "aws_s3_bucket" "example" {
  bucket = var.s3_bucket
  versioning {
    enabled = true
  }
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }  
  }

