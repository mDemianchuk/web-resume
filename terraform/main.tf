terraform {
  cloud {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.5.0"
}

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

module "storage" {
  source = "./modules/storage"

  source_bucket_name = var.source_bucket_name
}

module "network" {
  source = "./modules/network"
  providers = {
    aws           = aws
    aws.us_east_1 = aws.us_east_1
  }

  domain_name                        = var.domain_name
  subdomain_name                     = var.subdomain_name
  source_bucket_name                 = var.source_bucket_name
  source_bucket_prefix               = var.source_bucket_prefix
  source_bucket_regional_domain_name = module.storage.source_bucket_regional_domain_name
}

module "source_uploader" {
  source = "./modules/source_uploader"

  source_bucket_name   = var.source_bucket_name
  source_bucket_prefix = var.source_bucket_prefix
  upload_dir           = "${path.root}/${var.source_path}"
}
