provider "aws" {
  # already configured with aws configure
  # access_key = "${var.aws_access_key}"
  # secret_key = "${var.aws_secret_key}"

  # this one is also configured
  region = var.aws_region
}

