resource "aws_route_table" "dmz-route-table" {
  vpc_id = aws_vpc.demo-vpc-1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo-ig.id
  }
  depends_on = ["aws_internet_gateway.demo-ig"]
}

resource "aws_route_table" "priv-route-table" {
  vpc_id = aws_vpc.demo-vpc-1.id
  route {
    cidr_block = "0.0.0.0/0"
    network_interface_id = aws_instance.natgateway.primary_network_interface_id
    
  }
  depends_on = ["aws_instance.natgateway"]
}

resource "aws_internet_gateway" "demo-ig" {
  vpc_id = aws_vpc.demo-vpc-1.id

  tags = {
    Name = format("%s-igw", local.vpc_prefix)
  }
}
