resource "aws_db_instance" "reviews-app-db" {
  allocated_storage    = 10
  db_name              = "reviews_app_data"
  engine               = "postgres"
  engine_version       = "16.2"
  instance_class       = "db.t3.micro"
  username             = "superadmin"
  skip_final_snapshot  = true
  backup_retention_period = 7
  identifier = "reviews-app-db"
  manage_master_user_password = true
  db_subnet_group_name = aws_db_subnet_group.reviews_app_sub.name
  vpc_security_group_ids = [aws_security_group.reviews_app_sg.id]
  tags = {
    Name = "project-x"
  }
}

resource "aws_db_subnet_group" "reviews_app_sub" {
  name       = "reviews_app_subnets"
  subnet_ids = var.eks_vpc_subnet_ids #["subnet-0dbfb302199752bc2" ,"subnet-09e8de94c5c449353"]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_security_group" "reviews_app_sg" {
  name        = "reviews_app_sg"
  description = "Allow traffic from Security Group of the EKS worker nodes"
  vpc_id      = var.eks_cluster_vpc_id

  tags = {
    Name = "project-x"
  }

  ingress {
    from_port        = 5432
    to_port          = 5432
    protocol         = "tcp"
    security_groups = ["sg-0b9d79ea130d50930"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}