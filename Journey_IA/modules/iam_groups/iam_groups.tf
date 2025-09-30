resource "aws_iam_group" "this" {
  for_each = toset(var.group_names)

  name = each.value
  path = "/"
}