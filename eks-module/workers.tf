### IAM ROLE FOR WORKER NODE

resource "aws_iam_role" "eks_worker_role" {
  name = var.eks_worker_role_name    #"eks_worker_iam_role"  #"eks_worker_node_group_new"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = var.eks_worker_role_action #"sts:AssumeRole"
      Effect = var.eks_worker_role_effect #"Allow"
      Principal = {
        Service = var.eks_worker_role_service #"ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

### IAM ROLE POLICY ATTACHMENT 

resource "aws_iam_role_policy_attachment" "eks_worker_attach_policy" {
  for_each = toset(var.eks_worker_policies)
  policy_arn = each.key
  role       = aws_iam_role.eks_worker_role.name
}

# resource "aws_iam_role_policy_attachment" "cluster-AmazonEKSWorkerNodePolicy" {
#   policy_arn = var.eks_worker_node_policy_arn #"arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
#   role       = aws_iam_role.eks_worker_role.name
# }

# resource "aws_iam_role_policy_attachment" "cluster-AmazonEKS_CNI_Policy" {
#   policy_arn = var.eks_cni_policy_arn #"arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
#   role       = aws_iam_role.eks_worker_role.name
# }

# resource "aws_iam_role_policy_attachment" "cluster-AmazonEC2ContainerRegistryReadOnly" {
#   policy_arn = var.ec2_container_reg_policy_arn #"arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
#   role       = aws_iam_role.eks_worker_role.name
# }

### EKS MANAGED WORKER NODES

resource "aws_eks_node_group" "eks_worker_node" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = var.eks_node_group_name #"eks_worker_node"
  node_role_arn   = aws_iam_role.eks_worker_role.arn
  subnet_ids      = var.eks_vpc_subnet_ids 
  version         = var.eks_worker_version #"1.29"
  instance_types  = var.ec2_types #["t3.medium", "t2.medium"]
  capacity_type   = var.ec2_pricing_type #"SPOT"

  scaling_config {
    desired_size = var.eks_worker_desired_size #1
    max_size     = var.eks_worker_max_size #2
    min_size     = var.eks_worker_min_size #1
  }

  update_config {
    max_unavailable = var.eks_worker_max_unavailable #1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_attach_policy
  ]

  tags = {
    "k8s.io/cluster-autoscaler/project-x-dev-new" = "owned" 
    "k8s.io/cluster-autoscaler/enabled" = "true" 
  }
}



# resource "aws_launch_template" "eks_workers_lt" {
#   name_prefix   = var.eks_worker_lt_name #"project-x-eks-dev-worker-nodes"
#   image_id      = data.aws_ssm_parameter.eks_ami_id.value
#   instance_type = var.eks_worker_lt_inst_type #"t3.medium"

#     # #!/bin/bash
#     # set -o xtrace
#     # /etc/eks/bootstrap.sh project-x-dev

# }

# resource "aws_autoscaling_group" "eks_workers_asg" {
#   capacity_rebalance  = true
#   desired_capacity    = var.worker_desired_capacity #2
#   max_size            = var.worker_max_size #3
#   min_size            = var.worker_min_size #1
#   vpc_zone_identifier = var.eks_vpc_subnet_ids #["subnet-0dbfb302199752bc2", "subnet-09e8de94c5c449353"]

#   mixed_instances_policy {
#     instances_distribution {
#       on_demand_base_capacity                  = var.worker_on_demand_base_cap #0
#       on_demand_percentage_above_base_capacity = var.worker_on_demand_perc_above_base_cap #0
#       spot_allocation_strategy                 = var.worker_spot_alloc_strategy #"capacity-optimized"
#     }

#     launch_template {
#       launch_template_specification {
#         launch_template_id = aws_launch_template.eks_workers_lt.id
#       }

#       override {
#         instance_type     = var.lt_override_inst_type1 #"t3.medium"
#         weighted_capacity = var.lt_override_weighted_cap1 #"2"
#       }

#       override {
#         instance_type     = var.lt_override_inst_type2 #"t2.medium"
#         weighted_capacity = var.lt_override_weighted_cap2 #"2"
#       }
#     }
#   }
# }

# locals {
#   version = "1.29"
# }
# data "aws_ssm_parameter" "eks_ami_id" {
#   name = "/aws/service/eks/optimized-ami/${local.version}/amazon-linux-2/recommended/image_id"
# }
