resource "aws_key_pair" "demo-keypair" {
  key_name   = "aws-demo-key"
  public_key = var.pub_key
}