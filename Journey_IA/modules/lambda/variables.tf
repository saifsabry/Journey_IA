variable "lambda_configs" {
  type = map(object({
    function_name             = string
    role                      = string
    handler                   = string
    runtime                   = string
    timeout                   = number
    memory_size               = number
    package_type              = string
    architectures             = list(string)
    s3_bucket                 = string
    s3_key                    = string
    layers                    = list(string)
    environment_variables     = map(string)
    lifecycle_ignore_changes  = list(string)
    tags                      = map(string)
  }))
  description = "Map of Lambda function configurations"
  default     = {}
}