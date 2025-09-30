variable "group_names" {
  description = "A list of IAM group names to create."
  type        = list(string)
  default     = []
}