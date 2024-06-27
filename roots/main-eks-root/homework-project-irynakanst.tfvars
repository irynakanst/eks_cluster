#eks.tf

eks_cluster_name    = "project-x-dev-new"
eks_cluster_version = "1.29"
eks_vpc_subnet_ids  = ["subnet-0dbfb302199752bc2", "subnet-09e8de94c5c449353"]
# eks_ipv4_cidr              = "10.7.0.0/16"
eks_cluster_tag            = "project-x"
iam_policy_effect          = "Allow"
iam_policy_type            = "Service"
iam_policy_identifiers     = ["eks.amazonaws.com"]
iam_policy_actions         = ["sts:AssumeRole"]
iam_role_name              = "project-x-dev-eks-iam-role-new"
iam_role_policy_arn        = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
eks_cluster_sg_name        = "EKS Cluster Security Group New"
eks_cluster_sg_description = "Allow All inbound traffic from Self and all outbound traffic"
eks_cluster_vpc_id         = "vpc-0efe0b6e01d5c6b71"
eks_cluster_sg_tags = {
  Name                                  = "eks-cluster-sg"
  "kubernetes.io/cluster/project-x-dev" = "owned"
  "aws:eks:cluster-name"                = "project-x-dev-new"
}
sg_port_ipv4     = 0
sg_port_protocol = "-1"
sg_cidr_ipv4     = "0.0.0.0/0"
sg_cidr_ipv6     = "::/0"

#worker.tf
eks_worker_role_name    = "eks_worker_iam_role"
eks_worker_role_action  = "sts:AssumeRole"
eks_worker_role_effect  = "Allow"
eks_worker_role_service = "ec2.amazonaws.com"
eks_worker_policies = [
  "arn:aws:iam::861952334844:policy/Cluster-autoscaller"
  "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
  "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
  "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
]
# eks_worker_node_policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
# eks_cni_policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
# ec2_container_reg_policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
eks_node_group_name        = "eks_worker_node"
eks_worker_version         = "1.29"
ec2_types                  = ["t3.medium", "t2.medium"]
ec2_pricing_type           = "SPOT"
eks_worker_desired_size    = 2
eks_worker_max_size        = 5
eks_worker_min_size        = 1
eks_worker_max_unavailable = 1
# eks_worker_lt_name = "project-x-eks-dev-worker-nodes"
# eks_worker_lt_inst_type = "t3.medium"
# worker_desired_capacity = 2
# worker_max_size = 3
# worker_min_size = 1
# worker_on_demand_base_cap = 0
# worker_on_demand_perc_above_base_cap = 0
# worker_spot_alloc_strategy = "capacity-optimized"
# lt_override_inst_type1 = "t3.medium"
# lt_override_weighted_cap1 = 2
# lt_override_inst_type2 = "t2.medium"
# lt_override_weighted_cap2 = 2


#rds.tf

# allocated_storage          = 10
# db_name                    = "reviews_app_data"
# db_engine                  = "postgres"
# db_engine_version          = "12.19"
# inst_class                 = "db.t3.micro"
# db_username                = "superadmin"
# db_backup_retention_period = 7
# db_identifier              = "reviews-app-db"
# db_managed_password        = "true"
# db_tags                    = "project-x"
# db_subnet_gr_name          = "reviews_app_subnets"
# db_subnet_gr_tags          = "project-x"
# db_sg_name                 = "reviews_app_sg"
# db_sg_description          = "Allow traffic from Security Group of the EKS worker nodes"
# db_sg_tags                 = "project-x"
# db_ingress_port            = 5432
# db_ingress_protocol        = "tcp"
# db_egress_port             = 0
# db_egress_protocol         = "-1"
# db_egress_cidr             = ["0.0.0.0/0"]
