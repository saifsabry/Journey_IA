terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

locals {
  common_tags = {
    Environment = var.environment
    Project     = var.project_name
  }
  
  security_group_tags = {
    "OJ"                            = var.oj_tag
    "STAGE"                         = var.environment
    "aws:cloudformation:stack-name" = var.cloudformation_stack_name
    "aws:cloudformation:stack-id"   = var.cloudformation_stack_id
  }
  
  custom_roles = {
    "OjautoHostFileNodeRole" = {
      name          = "OjautoHostFileNodeRole"
      description   = ""
      principal_svc = ["lambda.amazonaws.com"]
    },
    "CloudWatch-CrossAccountSharingRole" = {
      name          = "CloudWatch-CrossAccountSharingRole"
      description   = ""
      principal_aws = [var.cloudwatch_cross_account_arn]
    },
    "one-journeyStepFunctionRole" = {
      name          = "one-journeyStepFunctionRole"
      description   = ""
      principal_svc = ["states.amazonaws.com"]
    }
  }
}

module "s3" {
  source = "./modules/s3"
  
  environment = var.environment
  common_tags = local.common_tags
}

module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  environment    = var.environment
  common_tags    = local.common_tags
}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
  tags   = local.security_group_tags
}

module "subnet" {
  source  = "./modules/subnet"
  vpc_id  = module.vpc.vpc_id
  subnets = var.subnets
}

module "routing" {
  source     = "./modules/routing"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.subnet.subnet_ids
}

module "iam_groups" {
  source      = "./modules/iam_groups"
  group_names = var.iam_group_names
}

module "lambda_functions" {
  source = "./modules/lambda"
}