variable "eks_vpc_subnet_ids" {
  type        = list
  default     = ["subnet-0dbfb302199752bc2", "subnet-09e8de94c5c449353"]
}

variable "eks_cluster_vpc_id" {
  type        = string
  default     = "vpc-0efe0b6e01d5c6b71"
}