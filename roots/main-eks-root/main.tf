module "project-x-eks-cluster" {
  source = "../../eks-module"
  # eks.tf
  eks_cluster_name           = var.eks_cluster_name
  eks_cluster_version        = var.eks_cluster_version
  eks_vpc_subnet_ids         = var.eks_vpc_subnet_ids
  eks_ipv4_cidr              = var.eks_ipv4_cidr
  eks_cluster_tag            = var.eks_cluster_tag
  iam_policy_effect          = var.iam_policy_effect
  iam_policy_type            = var.iam_policy_type
  iam_policy_identifiers     = var.iam_policy_identifiers
  iam_policy_actions         = var.iam_policy_actions
  iam_role_name              = var.iam_role_name
  iam_role_policy_arn        = var.iam_role_policy_arn
  eks_cluster_sg_name        = var.eks_cluster_sg_name
  eks_cluster_sg_description = var.eks_cluster_sg_description
  eks_cluster_vpc_id         = var.eks_cluster_vpc_id
  eks_cluster_sg_tags        = var.eks_cluster_sg_tags
  sg_port_ipv4               = var.sg_port_ipv4
  sg_port_protocol           = var.sg_port_protocol
  sg_cidr_ipv4               = var.sg_cidr_ipv4
  sg_cidr_ipv6               = var.sg_cidr_ipv6
  #worker.tf
  eks_worker_role_name = var.eks_worker_role_name
  eks_worker_role_action = var.eks_worker_role_action
  eks_worker_role_effect = var.eks_worker_role_effect
  eks_worker_role_service = var.eks_worker_role_service
  eks_worker_node_policy_arn = var.eks_worker_node_policy_arn
  eks_cni_policy_arn = var.eks_cni_policy_arn
  ec2_container_reg_policy_arn = var.ec2_container_reg_policy_arn
  eks_node_group_name = var.eks_node_group_name
  eks_worker_desired_size = var.eks_worker_desired_size
  eks_worker_max_size = var.eks_worker_max_size
  eks_worker_min_size = var.eks_worker_min_size
  eks_worker_max_unavailable = var.eks_worker_max_unavailable
  # eks_worker_lt_name                   = var.eks_worker_lt_name
  # eks_worker_lt_inst_type              = var.eks_worker_lt_inst_type
  # worker_desired_capacity              = var.worker_desired_capacity
  # worker_max_size                      = var.worker_max_size
  # worker_min_size                      = var.worker_min_size
  # worker_on_demand_base_cap            = var.worker_on_demand_base_cap
  # worker_on_demand_perc_above_base_cap = var.worker_on_demand_perc_above_base_cap
  # worker_spot_alloc_strategy           = var.worker_spot_alloc_strategy
  # lt_override_inst_type1               = var.lt_override_inst_type1
  # lt_override_weighted_cap1            = var.lt_override_weighted_cap1
  # lt_override_inst_type2               = var.lt_override_inst_type2
  # lt_override_weighted_cap2            = var.lt_override_weighted_cap2

}

### DATABASE


module "project-x-rds" {
  source = "../../rds-postgres-module"
  #rds.tf
  allocated_storage          = var.allocated_storage
  db_name                    = var.db_name
  db_engine                  = var.db_engine
  db_engine_version          = var.db_engine_version
  inst_class                 = var.inst_class
  db_username                = var.db_username
  db_backup_retention_period = var.db_backup_retention_period
  db_identifier              = var.db_identifier
  db_managed_password        = var.db_managed_password
  db_tags                    = var.db_tags
  db_subnet_gr_name          = var.db_subnet_gr_name
  eks_vpc_subnet_ids         = var.eks_vpc_subnet_ids
  db_subnet_gr_tags          = var.db_subnet_gr_tags
  db_sg_name                 = var.db_sg_name
  db_sg_description          = var.db_sg_description
  eks_cluster_vpc_id         = var.eks_cluster_vpc_id
  db_sg_tags                 = var.db_sg_tags
  db_ingress_port            = var.db_ingress_port
  eks_worker_sg_id           = module.project-x-eks-cluster.eks_worker_sg_id
  db_ingress_protocol        = var.db_ingress_protocol
  db_egress_port             = var.db_egress_port
  db_egress_protocol         = var.db_egress_protocol
  db_egress_cidr             = var.db_egress_cidr
}