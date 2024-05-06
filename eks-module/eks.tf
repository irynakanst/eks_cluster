resource "aws_eks_cluster" "cluster" {
  name     = var.eks_cluster_name  #"project-x-dev"
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = var.eks_cluster_version  #"1.29"

  vpc_config {
    subnet_ids = var.eks_vpc_subnet_ids #["subnet-0dbfb302199752bc2", "subnet-09e8de94c5c449353"]
    security_group_ids = [aws_security_group.eks_cluster_sg.id]
  }

  kubernetes_network_config {
    service_ipv4_cidr = var.eks_ipv4_cidr #"10.7.0.0/16"
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_role-AmazonEKSClusterPolicy
  ]

  tags = {
    Name = var.eks_cluster_tag #"project-x"
  }
}

# trust policy for the role
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = var.iam_policy_effect #"Allow"

    principals {
      type        = var.iam_policy_type #"Service"
      identifiers = var.iam_policy_identifiers #["eks.amazonaws.com"]
    }

    actions = var.iam_policy_actions #["sts:AssumeRole"]
  }
}

# create IAM role
resource "aws_iam_role" "eks_cluster_role" {
  name               = var.iam_role_name #"project-x-dev-eks-iam-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

# attach policy to the role
resource "aws_iam_role_policy_attachment" "eks_cluster_role-AmazonEKSClusterPolicy" {
  policy_arn = var.iam_role_policy_arn #"arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster_role.name
}


resource "aws_security_group" "eks_cluster_sg" {
  name        = var.eks_cluster_sg_name #"EKS Cluster Security Group"
  description = var.eks_cluster_sg_description #"Allow All inbound traffic from Self and all outbound traffic"
  vpc_id      = var.eks_cluster_vpc_id #"vpc-0efe0b6e01d5c6b71"

  tags = var.eks_cluster_sg_tags 
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.eks_cluster_sg.id
  referenced_security_group_id         = aws_security_group.eks_cluster_sg.id
  # from_port         = var.sg_port_ipv4 #0
  ip_protocol       = var.sg_port_protocol #"-1"
  # to_port           = var.sg_port_ipv4 #0
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.eks_cluster_sg.id
  cidr_ipv4         = var.sg_cidr_ipv4 #"0.0.0.0/0"
  ip_protocol       = var.sg_port_protocol  #"-1" semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.eks_cluster_sg.id
  cidr_ipv6         = var.sg_cidr_ipv6 #"::/0"
  ip_protocol       = var.sg_port_protocol #"-1" semantically equivalent to all ports
}


output "endpoint" {
  value = aws_eks_cluster.cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.cluster.certificate_authority[0].data
}
