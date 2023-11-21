provider "aws" {
  region = var.region

  assume_role {
    role_arn = var.deployment_role_arn
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "us_east_1"

  assume_role {
    role_arn = var.deployment_role_arn
  }
}
