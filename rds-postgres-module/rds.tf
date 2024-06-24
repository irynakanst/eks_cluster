# resource "aws_db_instance" "reviews-app-db" {
#   allocated_storage    = var.allocated_storage #10
#   db_name              = var.db_name #"reviews_app_data"
#   engine               = var.db_engine #"postgres"
#   engine_version       = var.db_engine_version #"16.2"
#   instance_class       = var.inst_class #"db.t3.micro"
#   username             = var.db_username #"superadmin"
#   skip_final_snapshot  = true
#   backup_retention_period = var.db_backup_retention_period #7
#   identifier = var.db_identifier #"reviews-app-db"
#   manage_master_user_password = var.db_managed_password #true
#   db_subnet_group_name = aws_db_subnet_group.reviews_app_sub.name
#   vpc_security_group_ids = [aws_security_group.reviews_app_sg.id]
#   tags = {
#     Name = var.db_tags
#  }
# }

# resource "aws_db_subnet_group" "reviews_app_sub" {
#   name       = var.db_subnet_gr_name #"reviews_app_subnets"
#   subnet_ids = var.eks_vpc_subnet_ids #["subnet-0dbfb302199752bc2" ,"subnet-09e8de94c5c449353"]
#   tags = {
#     Name = var.db_subnet_gr_tags
#   }
# }

# resource "aws_security_group" "reviews_app_sg" {
#   name        = var.db_sg_name #"reviews_app_sg"
#   description = var.db_sg_description #"Allow traffic from Security Group of the EKS worker nodes"
#   vpc_id      = var.eks_cluster_vpc_id
#   tags = {
#     Name = var.db_sg_tags
#   }

#   ingress {
#     from_port        = var.db_ingress_port #5432
#     to_port          = var.db_ingress_port #5432
#     protocol         = var.db_ingress_protocol #"tcp"
#     security_groups  = var.eks_worker_sg_id #["sg-08a33eb1cd299662f"]
#   }

#   egress {
#     from_port        = var.db_egress_port #0
#     to_port          = var.db_egress_port #0
#     protocol         = var.db_egress_protocol #"-1"
#     cidr_blocks      = var.db_egress_cidr #["0.0.0.0/0"]
#   }
# }
