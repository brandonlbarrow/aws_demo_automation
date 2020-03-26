resource "aws_elasticache_cluster" "demo-redis" {
  cluster_id = "demo-redis"
  engine = "redis"
  node_type = "cache.t2.small"
  num_cache_nodes = 1
  parameter_group_name = "default.redis3.2"
  engine_version = "3.2.10"
  port = 6379
}

## autoscaling group with centos7 ami
## listener for alb
## target group tied in with autoscaling group