resource "aws_elasticache_subnet_group" "demo-redis-subnetgroup" {
  name = "demo-redis-subnetgroup"
  subnet_ids = var.private_subnet_ids
}



resource "aws_elasticache_cluster" "demo-redis" {
  cluster_id = "demo-redis"
  engine = "redis"
  node_type = "cache.t2.small"
  num_cache_nodes = 1
  parameter_group_name = "default.redis3.2"
  engine_version = "3.2.10"
  port = 6379
  security_group_ids = [var.private_default_security_group_id]
  subnet_group_name = aws_elasticache_subnet_group.demo-redis-subnetgroup.name
}

