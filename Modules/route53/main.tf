#route 53 hosted zone
resource "aws_route53_zone" "private" {
  name = var.domain_name
  vpc {
    vpc_id = var.vpcid                #vpc id in which hosted zone to be created
  }
  tags = {
    Name = var.tags
  }
}

#route 53 record
resource "aws_route53_record" "database" {
  zone_id = aws_route53_zone.private.id
  name = var.record_name
  type = var.record_type
  ttl = var.ttl
  records = [var.db_endpoint]
}