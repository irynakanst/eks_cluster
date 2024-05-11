# data "aws_security_group" "eks_worker_sg_id" {
#   filter {
#     name   = "description"
#     values = ["EKS created security group applied to ENI that is attached to EKS Control Plane master nodes, as well as any managed workloads."]
#   }
# }

# output "eks_worker_sg_id" {
#   value       = data.aws_security_group.eks_worker_sg_id.id
# }


output "eks_worker_sg_id" {
  value       = aws_eks_cluster.cluster.vpc_config[0].cluster_security_group_id
}