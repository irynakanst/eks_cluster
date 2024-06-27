# resource "aws_iam_policy" "docdb_secrets_policy" {
#   name        = "docdb-secrets-policy"
#   description = "Policy to allow access to only the DocumentDB secret"

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect = "Allow",
#         Action = [
#           "secretsmanager:GetSecretValue"
#         ],
#         Resource = aws_secretsmanager_secret.docdb_secret.arn
#       }
#     ]
#   })
# }

# resource "aws_iam_role" "docdb_role" {
#   name               = "docdb-test-role"
#   assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

#   inline_policy {
#     name   = "docdb-secrets-policy"
#     policy = aws_iam_policy.docdb_secrets_policy.policy
#   }
# }

# data "aws_iam_policy_document" "assume_role_policy" {
#   statement {
#     effect = "Allow"
#     actions = [
#       "sts:AssumeRole"
#     ]

#     principals {
#       type        = "Service"
#       identifiers = ["rds.amazonaws.com"]
#     }
#   }
# }
