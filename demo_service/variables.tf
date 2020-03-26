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