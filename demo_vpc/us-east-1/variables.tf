variable "dmz_subnets" {
  default = {
      us-east-1a = "10.1.0.0/24",
      us-east-1b = "10.1.1.0/24",
      us-east-1c = "10.1.2.0/24"
  }
}

variable "priv_subnets" {
  default = {
      us-east-1a = "10.1.12.0/24",
      us-east-1b = "10.1.13.0/24",
      us-east-1c = "10.1.14.0/24"
  }
}

variable "nat_ami_id" {
  default = "ami-00a9d4a05375b2763"
}

variable "pub_key" {}