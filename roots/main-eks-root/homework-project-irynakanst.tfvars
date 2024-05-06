#eks.tf

eks_cluster_name = "project-x-dev"
eks_cluster_version = "1.29"
eks_vpc_subnet_ids = ["subnet-0dbfb302199752bc2", "subnet-09e8de94c5c449353"]
eks_ipv4_cidr = "10.7.0.0/16"
eks_cluster_tag = "project-x"
iam_policy_effect = "Allow"
iam_policy_type = "Service"
iam_policy_identifiers = ["eks.amazonaws.com"]
iam_policy_actions = ["sts:AssumeRole"]
iam_role_name = "project-x-dev-eks-iam-role-new"
iam_role_policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
eks_cluster_sg_name = "EKS Cluster Security Group New"
eks_cluster_sg_description = "Allow All inbound traffic from Self and all outbound traffic"
eks_cluster_vpc_id = "vpc-0efe0b6e01d5c6b71"
eks_cluster_sg_tags = {
     Name = "eks-cluster-sg"
    "kubernetes.io/cluster/project-x-dev" = "owned"
    "aws:eks:cluster-name"	= "project-x-dev"
}
sg_port_ipv4 = 0
sg_port_protocol = "-1"
sg_cidr_ipv4 = "0.0.0.0/0"
sg_cidr_ipv6 = "::/0"

#worker.tf

eks_worker_lt_name = "project-x-eks-dev-worker-nodes"
eks_worker_lt_inst_type = "t3.medium"
worker_desired_capacity = 2
worker_max_size = 3
worker_min_size = 1
worker_on_demand_base_cap = 0
worker_on_demand_perc_above_base_cap = 0
worker_spot_alloc_strategy = "capacity-optimized"
lt_override_inst_type1 = "t3.medium"
lt_override_weighted_cap1 = 2
lt_override_inst_type2 = "t2.medium"
lt_override_weighted_cap2 = 2