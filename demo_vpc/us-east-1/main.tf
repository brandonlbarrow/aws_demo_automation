locals {
  vpc_prefix = "demo-vpc-1"
}

resource "aws_vpc" "demo-vpc-1" {
  cidr_block = "10.1.0.0/16"
  tags = {
      Name = local.vpc_prefix
  }
}

resource "aws_subnet" "dmz-subnets" {
  for_each = tomap(var.dmz_subnets)
  vpc_id = aws_vpc.demo-vpc-1.id
  cidr_block = each.value
  availability_zone = each.key
  tags = {
      Name = format("dmz-%s", each.key)
  }
}

resource "aws_subnet" "private-subnets" {
  for_each = tomap(var.priv_subnets)
  vpc_id = aws_vpc.demo-vpc-1.id
  cidr_block = each.value
  availability_zone = each.key
  tags = {
      Name = format("priv-%s", each.key)
  }
}

resource "aws_route_table_association" "dmz" {
  for_each = aws_subnet.dmz-subnets
  subnet_id = each.value.id
  route_table_id = aws_route_table.dmz-route-table.id
  depends_on = ["aws_route_table.dmz-route-table"]
}

resource "aws_route_table_association" "priv" {
  for_each = aws_subnet.private-subnets
  subnet_id = each.value.id
  route_table_id = aws_route_table.priv-route-table.id
  depends_on = ["aws_route_table.priv-route-table"]
}