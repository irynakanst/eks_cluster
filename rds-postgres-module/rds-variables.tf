### RDS INSTANCE 

variable "allocated_storage" {
  type        = number
  default     = 10
}

variable "db_name" {
  type        = string
}

variable "db_engine" {
  type        = string
}

variable "db_engine_version" {
  type        = string
}

variable "inst_class" {
  type        = string
}

variable "db_username" {
  type        = string
}

variable "db_backup_retention_period" {
  type        = number
  default     = 7
}

variable "db_identifier" {
  type        = string
}

variable "db_managed_password" {
  type        = string
  default     = "true"
}

variable "db_tags" {
  type        = string
}

### DB SUBNET GROUP

variable "db_subnet_gr_name" {
  type        = string
}

variable "eks_vpc_subnet_ids" {
  type        = list
  default     = ["subnet-0dbfb302199752bc2", "subnet-09e8de94c5c449353"]
}

variable "db_subnet_gr_tags" {
  type        = string
}

### DB SECURITY GROUP

variable "db_sg_name" {
  type        = string
}

variable "db_sg_description" {
  type        = string
}

variable "eks_cluster_vpc_id" {
  type        = string
  default     = "vpc-0efe0b6e01d5c6b71"
}

variable "db_sg_tags" {
  type        = string
}

 variable "db_ingress_port" {
   type        = number
}
 
variable "db_ingress_protocol" {
  type        = string
  default     = "tcp"
}

variable "db_egress_port" {
  type        = number
  default     = 0
}

variable "db_egress_protocol" {
  type        = string
  default     = "-1"
}

variable "db_egress_cidr" {
  type        = string
  default     = ["0.0.0.0/0"]
}
