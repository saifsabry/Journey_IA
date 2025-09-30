variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "subnet_ids" {
  description = "A map of subnet names to their IDs for route table association."
  type        = map(string)
  default     = {}
}

variable "common_tags" {
  description = "A map of common tags to apply to resources."
  type        = map(string)
  default     = {}
}