provider "aws" {
  region = var.default_region

  assume_role {
    role_arn = var.deployment_role_arn
  }
}
