resource "aws_subnet" "this" {
  for_each = { for sub in var.subnets : sub.name => sub }

  vpc_id            = var.vpc_id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  map_public_ip_on_launch = false

  tags = merge(
    var.common_tags,
    {
      "Name" = each.value.name
    }
  )
}