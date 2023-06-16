resource "aws_s3_bucket" "example" {
  bucket = "pawan2876"
  versioning {
    enabled = true
  }
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
