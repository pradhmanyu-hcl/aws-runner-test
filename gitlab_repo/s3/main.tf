#s3 bucket
resource "aws_s3_bucket" "s3" {
  bucket = var.bucket_name
  object_lock_enabled = var.object_lock_enabled
  force_destroy = var.force_destroy
}

#bucket ownership
resource "aws_s3_bucket_ownership_controls" "s3own" {
  bucket = aws_s3_bucket.s3.id
  rule {
    object_ownership = var.object_ownership
  }
}

#bucket acl
resource "aws_s3_bucket_acl" "s3acl" {
  depends_on = [ aws_s3_bucket_ownership_controls.s3own ] 
  bucket = aws_s3_bucket.s3.id
  acl = var.bucket_acl
}

#bucket versioning
resource "aws_s3_bucket_versioning" "s3ver" {
  bucket = aws_s3_bucket.s3.id
  versioning_configuration {
    status = var.versioning_status
  }
}