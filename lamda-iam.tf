resource "aws_iam_role_policy" "demo_lambda_policy" {
  name   = "demo_lambda_policy"
  role   = aws_iam_role.demo_lambda_role.id
  policy = file("iam/demo_lambda_policy.json")
}

resource "aws_iam_role" "demo_lambda_role" {
  name = "demo_lambda_role"

  assume_role_policy = file("iam/demo_lambda_assume_policy.json")

  tags = {
    Demo = "terraform"
  }
}

output "iam_lambda_role_name" {
  value = aws_iam_role.demo_lambda_role.name
}
