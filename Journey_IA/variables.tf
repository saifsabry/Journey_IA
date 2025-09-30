variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "eu-west-1"
}

variable "environment" {
  description = "Environment name (e.g., genai, prod, dev)"
  type        = string
  default     = "genai"
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
  default     = "OneJourney"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/24"
}

variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))
  default = [
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

variable "iam_group_names" {
  description = "List of IAM group names to create"
  type        = list(string)
  default = [
    "Developers",
    "ManagedMFA",
    "RequiredMFA",
  ]
}

variable "oj_tag" {
  description = "OJ tag value"
  type        = string
  default     = "OJ"
}

variable "cloudformation_stack_name" {
  description = "CloudFormation stack name"
  type        = string
  default     = "one-journey-back-as-ecs-genai"
}

variable "cloudformation_stack_id" {
  description = "CloudFormation stack ID"
  type        = string
  default     = "arn:aws:cloudformation:eu-west-1:971422687659:stack/one-journey-back-as-ecs-genai/2cebadf0-15f1-11f0-90e8-0658f6897213"
}

variable "cloudwatch_cross_account_arn" {
  description = "ARN for CloudWatch cross-account sharing"
  type        = string
  default     = "arn:aws:iam::532498934072:root"
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}