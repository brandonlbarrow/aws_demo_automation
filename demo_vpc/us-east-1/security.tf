resource "aws_key_pair" "demo-keypair" {
  key_name   = "aws-demo-key"
  public_key = var.pub_key
}

resource "aws_security_group" "public-default" {
  name = "public-default"
  description = "Allow HTTP externally"
  vpc_id = aws_vpc.demo-vpc-1.id
  
  ingress {
    description = "Internet traffic"
    from_port  = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public-default"
  }
}

resource "aws_security_group" "private-default" {
  name  = "private-default"
  description = "Allow all locally"
  vpc_id  = aws_vpc.demo-vpc-1.id

  ingress {
    description = "Local traffic"
    from_port  = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [aws_vpc.demo-vpc-1.cidr_block]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private-default"
  }
}