module "project-x-eks-cluster" {
  source = "../../eks-module"

  # eks.tf
  eks_cluster_name = var.eks_cluster_name 
  eks_cluster_version = var.eks_cluster_version
  eks_vpc_subnet_ids = var.eks_vpc_subnet_ids
  eks_ipv4_cidr = var.eks_ipv4_cidr
  eks_cluster_tag = var.eks_cluster_tag
  iam_policy_effect = var.iam_policy_effect
  iam_policy_type = var.iam_policy_type
  iam_policy_identifiers = var.iam_policy_identifiers
  iam_policy_actions = var.iam_policy_actions
  iam_role_name = var.iam_role_name
  iam_role_policy_arn = var.iam_role_policy_arn
  eks_cluster_sg_name = var.eks_cluster_sg_name
  eks_cluster_sg_description = var.eks_cluster_sg_description
  eks_cluster_vpc_id = var.eks_cluster_vpc_id
  eks_cluster_sg_tags = var.eks_cluster_sg_tags 
  sg_port_ipv4 = var.sg_port_ipv4
  sg_port_protocol = var.sg_port_protocol
  sg_cidr_ipv4 = var.sg_cidr_ipv4
  sg_cidr_ipv6 = var.sg_cidr_ipv6

  #worker.tf

  eks_worker_lt_nam = var.eks_worker_lt_name
  eks_worker_lt_inst_type = var.eks_worker_lt_inst_type
  worker_desired_capacity = var.worker_desired_capacity
  worker_max_size = var.worker_max_size
  worker_min_size = var.worker_min_size
  worker_on_demand_base_cap = var.worker_on_demand_base_cap
  worker_on_demand_perc_above_base_cap = var.worker_on_demand_perc_above_base_cap
  worker_spot_alloc_strategy = var.worker_spot_alloc_strategy
  lt_override_inst_type1 = var.lt_override_inst_type1
  lt_override_weighted_cap1 = var.lt_override_weighted_cap1
  lt_override_inst_type2 = var.lt_override_inst_type2
  lt_override_weighted_cap2 = var.lt_override_weighted_cap2

}
