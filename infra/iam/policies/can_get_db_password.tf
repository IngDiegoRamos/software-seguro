resource "aws_iam_policy" "can_get_db_password" {
  name        = "can-get-db-password"
  path        = "/"
  description = "Allow access to retrieve secrets from Secrets Manager"

  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Effect : "Allow",
        Action : [
          "secretsmanager:GetSecretValue"
        ],
        Resource : [
          "arn:aws:secretsmanager:us-east-2:101451734847:secret:rds!db-0f4f325a-bd83-4db0-b036-856d4f83060c-KJnPns"
        ]
      }
    ]
  })
}

output "can_get_db_password_arn" {
  value = aws_iam_policy.can_get_db_password.arn
}