data "aws_vpc" "demo-vpc" {
  id = var.vpc_id
}

data "template_file" "demo-user-data" {
  template = file("${path.module}/files/demo-user-data.tpl")
}

data "template_cloudinit_config" "demo-user-data-config" {
  gzip = true
  base64_encode = true
  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.demo-user-data.rendered}"
  }
}

resource "aws_launch_configuration" "demo-service-launch" {
  name_prefix = "demo-service-launch-"
  image_id = var.ami_id
  instance_type = "t2.micro"
  key_name = "aws-demo-key"
  security_groups = [var.private_default_security_group_id]
  user_data_base64 = "${data.template_cloudinit_config.demo-user-data-config.rendered}"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "demo-service-autoscale" {
  name = "demo-service-autoscale"
  max_size = 3
  min_size = 1
  desired_capacity = 2
  health_check_type = "ELB"
  target_group_arns = [aws_lb_target_group.demo-tg.arn]
  launch_configuration = aws_launch_configuration.demo-service-launch.name
  vpc_zone_identifier = var.private_subnet_ids
}