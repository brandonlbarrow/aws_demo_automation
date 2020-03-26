resource "aws_lb" "demo-alb" {
  name = "demo-service-lb"
  internal = false
  load_balancer_type = "application"
  subnets = var.dmz_subnet_ids
}

resource "aws_lb_target_group" "demo-tg" {
  name = "demo-service-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = data.aws_vpc.demo-vpc.id
}

resource "aws_lb_listener" "demo-listener" {
  load_balancer_arn = aws_lb.demo-alb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type  = "forward"
    target_group_arn = aws_lb_target_group.demo-tg.arn
  }
}