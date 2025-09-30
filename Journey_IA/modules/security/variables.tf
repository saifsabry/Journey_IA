variable "vpc_id" {
  description = "The ID of the VPC where security groups will be created."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the security groups."
  type        = map(string)
  default     = {}
}