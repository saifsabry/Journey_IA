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
    Environment = "genai"
    Project     = "OneJourney"
  }
   security_group_tags = {
    "OJ"                            = "OJ"
    "STAGE"                         = "genai"
    "aws:cloudformation:stack-name" = "one-journey-back-as-ecs-genai"
    "aws:cloudformation:stack-id"   = "arn:aws:cloudformation:eu-west-1:971422687659:stack/one-journey-back-as-ecs-genai/2cebadf0-15f1-11f0-90e8-0658f6897213"
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
      principal_aws = ["arn:aws:iam::532498934072:root"] 
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
  common_tags = var.common_tags
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr_block = "10.0.0.0/24" 

  environment = var.environment
  common_tags = var.common_tags
}

module "security" {
  source = "./modules/security"
  # Pass the VPC ID from the networking module's output
  vpc_id = module.vpc.vpc_id

  tags = local.security_group_tags
}

module "subnet" {
  source = "./modules/subnet"

  # Pass the VPC ID from your VPC module's output
  vpc_id = module.vpc.vpc_id

  # Define the subnets based on your JSON data
  subnets = [
    {
      name              = "subnet1-euwest1"
      cidr_block        = "10.0.0.0/26"
      availability_zone = "eu-west-1a"
    },
    {
      name              = "subnet2-euwest1"
      cidr_block        = "10.0.0.64/26"
      availability_zone = "eu-west-1b"
    }
  ]
}

module "routing" {
  source = "./modules/routing"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.subnet.subnet_ids
}

module "iam_groups" {
  source = "./modules/iam_groups"
  group_names = [
    "Developers",
    "ManagedMFA",
    "RequiredMFA",
  ]
}

