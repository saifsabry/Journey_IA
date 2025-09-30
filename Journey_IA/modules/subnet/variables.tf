variable "vpc_id" {
  description = "The ID of the VPC where the subnets will be created."
  type        = string
}

variable "subnets" {
  description = "A list of subnet objects to create, each with a name, CIDR block, and availability zone."
  type = list(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))
  default = []
}

variable "common_tags" {
  description = "A map of common tags to apply to all subnets."
  type        = map(string)
  default     = {}
}