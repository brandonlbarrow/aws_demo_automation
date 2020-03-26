resource "aws_lb" "demo-alb" {
  name = "demo-service-lb"
  internal = false
  load_balancer_type = "application"
  subnets = var.dmz_subnet_ids
}