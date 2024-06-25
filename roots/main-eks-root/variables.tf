### EKS CLUSTER

variable "eks_cluster_name" {
  type    = string
  default = "project-x-dev-new"
}

variable "eks_cluster_version" {
  type    = string
  default = "1.29"
}

variable "eks_vpc_subnet_ids" {
  type    = list(any)
  default = ["subnet-0dbfb302199752bc2", "subnet-09e8de94c5c449353"]
}

# variable "eks_ipv4_cidr" {
#   type    = string
#   default = "10.7.0.0/16"
# }

variable "eks_cluster_tag" {
  type    = string
  default = "project-x"
}

### TRUST POLICY FOR THE ROLE

variable "iam_policy_effect" {
  type    = string
  default = "Allow"
}

variable "iam_policy_type" {
  type    = string
  default = "Service"
}

variable "iam_policy_identifiers" {
  type    = list(any)
  default = ["eks.amazonaws.com"]
}

variable "iam_policy_actions" {
  type    = list(any)
  default = ["sts:AssumeRole"]
}

### IAM ROLE FOR EKS CLUSTER

variable "iam_role_name" {
  type    = string
  default = "project-x-dev-eks-iam-role-new"
}

### ATTACH POLICY TO THE ROLE 

variable "iam_role_policy_arn" {
  type    = string
  default = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

### SECURITY GROUP FOR EKS CLUSTER

variable "eks_cluster_sg_name" {
  type    = string
  default = "EKS Cluster Security Group New"
}

variable "eks_cluster_sg_description" {
  type    = string
  default = "Allow All inbound traffic from Self and all outbound traffic"
}

variable "eks_cluster_vpc_id" {
  type    = string
  default = "vpc-0efe0b6e01d5c6b71"
}

variable "eks_cluster_sg_tags" {
  type = map(any)
  default = {
    Name                                  = "eks-cluster-sg"
    "kubernetes.io/cluster/project-x-dev" = "owned"
    "aws:eks:cluster-name"                = "project-x-dev"
  }
}

### SECURITY GROUP INGRESS ANS EGRESS RULES FOR EKS CLUSTER

variable "sg_port_ipv4" {
  type    = number
  default = 0
}

variable "sg_port_protocol" {
  type    = string
  default = "-1"
}

variable "sg_cidr_ipv4" {
  type    = string
  default = "0.0.0.0/0"
}

variable "sg_cidr_ipv6" {
  type    = string
  default = "::/0"
}

### IAM ROLE FOR WORKER NODE

variable "eks_worker_role_name" {
  type = string
}

variable "eks_worker_role_action" {
  type = string
}

variable "eks_worker_role_effect" {
  type = string
}

variable "eks_worker_role_service" {
  type = string
}

### IAM ROLE POLICY ATTACHMENT 

variable "eks_worker_policies" {
  type = list(string)
}

# variable "eks_worker_node_policy_arn" {
#   type = string
# }

# variable "eks_cni_policy_arn" {
#   type = string
# }

# variable "ec2_container_reg_policy_arn" {
#   type = string
# }

### EKS MANAGED WORKER NODES 

variable "eks_node_group_name" {
  type = string
}

variable "eks_worker_version" {
  type    = string
  default = "1.29"
}

variable "ec2_types" {
  type = list(string)
}

variable "ec2_pricing_type" {
  type = string
}

variable "eks_worker_desired_size" {
  type = number
}

variable "eks_worker_max_size" {
  type = number
}

variable "eks_worker_min_size" {
  type = number
}

variable "eks_worker_max_unavailable" {
  type = number
}

### RDS INSTANCE 

variable "allocated_storage" {
  type    = number
  default = 10
}

variable "db_name" {
  type = string
}

variable "db_engine" {
  type = string
}

variable "db_engine_version" {
  type = string
}

variable "inst_class" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_backup_retention_period" {
  type    = number
  default = 7
}

variable "db_identifier" {
  type = string
}

variable "db_managed_password" {
  type    = string
  default = "true"
}

variable "db_tags" {
  type = string
}

### DB SUBNET GROUP

variable "db_subnet_gr_name" {
  type = string
}


variable "db_subnet_gr_tags" {
  type = string
}

### DB SECURITY GROUP

variable "db_sg_name" {
  type = string
}

variable "db_sg_description" {
  type = string
}

variable "db_sg_tags" {
  type = string
}

variable "db_ingress_port" {
  type = number
}

variable "db_ingress_protocol" {
  type    = string
  default = "tcp"
}

# variable "eks_worker_sg_id" {
#   type        = list
# }

variable "db_egress_port" {
  type    = number
  default = 0
}

variable "db_egress_protocol" {
  type    = string
  default = "-1"
}

variable "db_egress_cidr" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

### WORKER NODE LAUNCH TEMPLATE

# variable "eks_worker_lt_name" {
#   type        = string
#   default     = "project-x-eks-dev-worker-nodes"
# }

# variable "eks_worker_lt_inst_type" {
#   type        = string
#   default     = "t3.medium"
# }

### WORKER NODE ASG

# variable "worker_desired_capacity" {
#   type        = number
#   default     = 2
# }

# variable "worker_max_size" {
#   type        = number
#   default     = 3
# }

# variable "worker_min_size" {
#   type        = number
#   default     = 1
# }

# variable "worker_on_demand_base_cap" {
#   type        = number
#   default     = 0
# }

# variable "worker_on_demand_perc_above_base_cap" {
#   type        = number
#   default     = 0
# }

# variable "worker_spot_alloc_strategy" {
#   type        = string
#   default     = "capacity-optimized"
# }

# variable "lt_override_inst_type1" {
#   type        = string
#   default     = "t3.medium"
# }

# variable "lt_override_weighted_cap1" {
#   type        = number
#   default     = 2
# }

# variable "lt_override_inst_type2" {
#   type        = string
#   default     = "t2.medium"
# }

# variable "lt_override_weighted_cap2" {
#   type        = number
#   default     = 2
# }