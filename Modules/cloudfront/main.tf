#Setup s3 bucket
resource "aws_s3_bucket" "cdnbucket" {
  bucket = var.bucket_name
  object_lock_enabled = var.object_lock_enabled
  force_destroy = var.force_destroy
}

#Enable versioning
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = var.bucket_name
  versioning_configuration {
    status = var.versioning_status
  }
}

#Cloudfront distribution
resource "aws_cloudfront_distribution" "name" {
  origin {
    domain_name = join(".",[var.bucket_name,"s3","amazonaws.com"])
    origin_id = "s3-${var.bucket_name}"
    }
  enabled = true
  price_class = var.price_class
  default_cache_behavior {
    allowed_methods = ["DELETE","GET","HEAD","OPTIONS","PATCH","POST","PUT"]
    cached_methods = ["GET","HEAD"]
    target_origin_id = "s3-${var.bucket_name}"
    forwarded_values {
      query_string = true
      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "allow-all"
    min_ttl = var.min_ttl
    default_ttl = 3600
    max_ttl = var.max_ttl
  }
  retain_on_delete = var.retain_on_delete
  viewer_certificate {
    cloudfront_default_certificate = true
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  
  }

