data "aws_subnet_ids" "dmz" {
  vpc_id = aws_vpc.demo-vpc-1.id
  filter {
    name = "tag:Name"
    values = ["dmz-*"]
  }
}

resource "aws_network_interface" "nat_interface" {
  subnet_id = sort(data.aws_subnet_ids.dmz.ids)[0]
  security_groups = [aws_security_group.private-default.id]
  source_dest_check = false
}

resource aws_instance "natgateway" {
  ami = var.nat_ami_id
  instance_type = "t2.micro"
  key_name = "aws-demo-key"
  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.nat_interface.id
  }
  tags = {
      Name = format("%s-natgw", local.vpc_prefix)
  }
}

resource "aws_eip" "nat-eip" {
  instance = aws_instance.natgateway.id
  vpc = true
}
