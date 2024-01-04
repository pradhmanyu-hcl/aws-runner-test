#security group for elasticache
resource "aws_security_group" "elc" {
  vpc_id = var.vpc_id
  name = var.sgelc_name
  ingress {
    from_port = var.sgelc_ingress_from_port
    to_port = var.sgelc_ingress_to_port
    protocol = var.sgelc_ingress_protocol
    cidr_blocks = [var.vpc_cidr]
  }
  egress {
    from_port = var.sgelc_egress_from_port
    to_port = var.sgelc_egress_to_port
    protocol = var.sgelc_egress_protocol
    cidr_blocks = [var.vpc_cidr]
  }
}

#elasticache subnet group 
resource "aws_elasticache_subnet_group" "elc-subnet" {
  name = var.cache_subnet_group_name
  subnet_ids = var.subnet_ids                    #database subnet ids 
}

#elasticache replication group for redis cluster
resource "aws_elasticache_replication_group" "elc-rg" {
  replication_group_id = var.replication_group_id
  description = var.rep_description
  automatic_failover_enabled = var.automatic_failover_enabled
  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  transit_encryption_enabled = var.transit_encryption_enabled
  multi_az_enabled = var.multi_az_enabled
  engine = var.cache_engine
  port = var.cache_port
  node_type = var.node_type
  num_cache_clusters = var.num_cache_nodes
  parameter_group_name = var.parameter_group
  subnet_group_name = aws_elasticache_subnet_group.elc-subnet.name
  snapshot_retention_limit = var.snapshot_retention_limit
  snapshot_window = var.snapshot_window
  security_group_ids = [aws_security_group.elc.id]
}