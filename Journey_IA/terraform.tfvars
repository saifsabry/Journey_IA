# terraform.tfvars
# Override default values for specific environments

aws_region   = "eu-west-1"
environment  = "genai"
project_name = "OneJourney"

vpc_cidr_block = "10.0.0.0/24"

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

iam_group_names = [
  "Developers",
  "ManagedMFA",
  "RequiredMFA",
]

oj_tag                      = "OJ"
cloudformation_stack_name   = "one-journey-back-as-ecs-genai"
cloudformation_stack_id     = "arn:aws:cloudformation:eu-west-1:971422687659:stack/one-journey-back-as-ecs-genai/2cebadf0-15f1-11f0-90e8-0658f6897213"
cloudwatch_cross_account_arn = "arn:aws:iam::532498934072:root"