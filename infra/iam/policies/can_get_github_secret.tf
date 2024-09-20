resource "aws_iam_policy" "can_get_github_secret" {
  name        = "can-get-github-webhook-secret"
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
          "arn:aws:secretsmanager:us-east-2:101451734847:secret:github/secret-QSnhVQ"
        ]
      }
    ]
  })
}

output "can_get_github_secret_arn" {
  value = aws_iam_policy.can_get_github_secret.arn
}