resource "aws_s3_bucket" "pbl-s3" {
  bucket = "pbl-mayor-eks-cluster-bucket"
}

resource "aws_s3_bucket_acl" "pbl-acl" {
  bucket = aws_s3_bucket.pbl-s3.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "pbl-s3-versioning" {
  bucket = aws_s3_bucket.pbl-s3.id
  versioning_configuration {
    status = "Enabled"
  }
}