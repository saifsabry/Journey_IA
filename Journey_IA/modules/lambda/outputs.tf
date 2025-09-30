output "lambda_functions" {
  description = "Map of all Lambda function details"
  value = {
    for key, lambda in aws_lambda_function.this : key => {
      function_name = lambda.function_name
      function_arn  = lambda.arn
      invoke_arn    = lambda.invoke_arn
    }
  }
}

output "function_names" {
  description = "Map of Lambda function names"
  value = {
    for key, lambda in aws_lambda_function.this : key => lambda.function_name
  }
}

output "function_arns" {
  description = "Map of Lambda function ARNs"
  value = {
    for key, lambda in aws_lambda_function.this : key => lambda.arn
  }
}

output "invoke_arns" {
  description = "Map of Lambda invoke ARNs"
  value = {
    for key, lambda in aws_lambda_function.this : key => lambda.invoke_arn
  }
}