### EKS CLUSTER

variable "eks_cluster_name" {
  type        = string
  default     = "project-x-dev-new"
}

variable "eks_cluster_version" {
  type        = string
  default     = "1.29"
}

variable "eks_vpc_subnet_ids" {
  type        = list
  default     = ["subnet-0dbfb302199752bc2", "subnet-09e8de94c5c449353"]
}

variable "eks_ipv4_cidr" {
  type        = string
  default     = "10.7.0.0/16"
}

variable "eks_cluster_tag" {
  type        = string
  default     = "project-x"
}

### TRUST POLICY FOR THE ROLE

variable "iam_policy_effect" {
  type        = string
  default     = "Allow"
}

variable "iam_policy_type" {
  type        = string
  default     = "Service"
}

variable "iam_policy_identifiers" {
  type        = list
  default     = ["eks.amazonaws.com"]
}

variable "iam_policy_actions" {
  type        = list
  default     = ["sts:AssumeRole"]
}

### IAM ROLE 

variable "iam_role_name" {
  type        = string
  default     = "project-x-dev-eks-iam-role-new"
}

### ATTACH POLICY TO THE ROLE 

variable "iam_role_policy_arn" {
  type        = string
  default     = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

### SECURITY GROUP 

variable "eks_cluster_sg_name" {
  type        = string
  default     = "EKS Cluster Security Group New"
}

variable "eks_cluster_sg_description" {
  type        = string
  default     = "Allow All inbound traffic from Self and all outbound traffic"
}

variable "eks_cluster_vpc_id" {
  type        = string
  default     = "vpc-0efe0b6e01d5c6b71"
}

variable "eks_cluster_sg_tags" {
  type        = map
  default     = {
    Name = "eks-cluster-sg"
    "kubernetes.io/cluster/project-x-dev" = "owned"
    "aws:eks:cluster-name"	= "project-x-dev"
  }
}

### SECURITY GROUP INGRESS ANS EGRESS RULES

variable "sg_port_ipv4" {
  type        = number
  default     = 0
}

variable "sg_port_protocol" {
  type        = string
  default     = "-1"
}

variable "sg_cidr_ipv4" {
  type        = string
  default     = "0.0.0.0/0"
}

variable "sg_cidr_ipv6" {
  type        = string
  default     = "::/0"
}

### WORKER NODE LAUNCH TEMPLATE

variable "eks_worker_lt_name" {
  type        = string
  default     = "project-x-eks-dev-worker-nodes"
}

variable "eks_worker_lt_inst_type" {
  type        = string
  default     = "t3.medium"
}

### WORKER NODE ASG

variable "worker_desired_capacity" {
  type        = number
  default     = 2
}

variable "worker_max_size" {
  type        = number
  default     = 3
}

variable "worker_min_size" {
  type        = number
  default     = 1
}

variable "worker_on_demand_base_cap" {
  type        = number
  default     = 0
}

variable "worker_on_demand_perc_above_base_cap" {
  type        = number
  default     = 0
}

variable "worker_spot_alloc_strategy" {
  type        = string
  default     = "capacity-optimized"
}

variable "lt_override_inst_type1" {
  type        = string
  default     = "t3.medium"
}

variable "lt_override_weighted_cap1" {
  type        = number
  default     = 2
}

variable "lt_override_inst_type2" {
  type        = string
  default     = "t2.medium"
}

variable "lt_override_weighted_cap2" {
  type        = number
  default     = 2
}
