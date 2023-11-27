#elasticache subnet group
resource "aws_elasticache_subnet_group" "elc-subnet" {
  name = var.subnet_group
  subnet_ids = var.subnet_ids                    #database subnet ids 
}

#elasticache replication group for redis cluster
resource "aws_elasticache_replication_group" "elc-rg" {
  replication_group_id = var.replication_group_id
  description = var.rep_description
  engine = var.engine
  port = var.port
  node_type = var.node_type
  num_cache_clusters = var.num_cache_nodes
  parameter_group_name = var.parameter_group
  subnet_group_name = aws_elasticache_subnet_group.elc-subnet.name
}