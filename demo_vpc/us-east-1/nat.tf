data "aws_subnet_ids" "dmz" {
  vpc_id = aws_vpc.demo-vpc-1.id
  filter {
    name = "tag:Name"
    values = ["dmz-*"]
  }
}

resource aws_instance "natgateway" {
  ami = var.nat_ami_id
  subnet_id = sort(data.aws_subnet_ids.dmz.ids)[0]
  instance_type = "t2.micro"
  source_dest_check = false
  key_name = "aws-demo-key"
  tags = {
      Name = format("%s-natgw", local.vpc_prefix)
  }
}

resource "aws_eip" "nat-eip" {
  instance = aws_instance.natgateway.id
  vpc = true
}
