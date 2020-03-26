# data "aws_subnet_ids" "private" {
#   vpc_id = aws_vpc.demo-vpc-1.id

#   tags = {
#       Name = ""
#   }
# }

# data "aws_subnet" "private" {
#   for_each = data.aws_subnet_ids.subnets.ids
#   id = each.value
# }

# output "vpc" {
#   value = aws_vpc.demo-vpc-1.id
# }

# output "subnets" {
#   value = [for s in data.aws_subnet.subnet : s.id]
# }