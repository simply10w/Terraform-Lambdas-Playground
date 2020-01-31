variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

terraform {
  # to have state of the infrastructure as single source of truth
  backend "s3" {
    bucket = "simply10wdemoterraform"
    key    = "demo/lambda/terraform.tfstate"
    region = "eu-central-1"
    # to have lock file as single source of truth
    # dynamodb_table = "simply10wdemoterraform"
  }
}
