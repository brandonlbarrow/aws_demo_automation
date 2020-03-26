variable "vpc_id" {
  default = "vpc-07682a9077835a35e"
}

variable "dmz_subnet_ids" {
  default = [
      "subnet-02cf61f43b4c977a5",
      "subnet-01fd4c017ebfebb98",
      "subnet-0d3486ddcc9c2b002"
  ]
}
variable "private_subnet_ids" {
  default = [
      "subnet-0939729cdaea442e2",
      "subnet-00766ef385539eadd",
      "subnet-03b83a45f42f38cd4"
  ]
}

variable "private_default_security_group_id" {
  default = "sg-04ff8e734a7685625"
}

variable "ami_id" {
  default = "ami-0fc61db8544a617ed"
}

variable "pub_key" {}