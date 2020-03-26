resource "aws_route53_zone" "demoservice" {
  name = "awsdemo.io."
}

resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.demoservice.zone_id}"
  name = "www.${aws_route53_zone.demoservice.name}"
  type = "CNAME"
  ttl  = "1"
  latency_routing_policy {
    region = "us-east-1"
  }
  set_identifier = "us-east-1"
  records = [aws_lb.demo-alb.dns_name]
  depends_on = ["aws_lb.demo-alb"]
}