provider "aws" {
  region = "us-west-2"  # Replace with your desired region  
}

#s3 bucket 
resource "aws_s3_bucket" "s3" {
  bucket = var.bucket
  object_lock_enabled = true
  
}

#bucket ownership
resource "aws_s3_bucket_ownership_controls" "s3own" {
  bucket = aws_s3_bucket.s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

#bucket acl
resource "aws_s3_bucket_acl" "acl" {
  depends_on = [ aws_s3_bucket_ownership_controls.s3own ]
  bucket = aws_s3_bucket.s3.id
  acl = "private"
}

#bucket versioning
resource "aws_s3_bucket_versioning" "s3ver" {
  bucket = aws_s3_bucket.s3.id
  versioning_configuration {
    status = "Enabled"
  }
}
