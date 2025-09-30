echo "Starting subnets import process..."
echo "======================================="

terraform import "module.subnet.aws_subnet.this[\"subnet1-euwest1\"]" subnet-0abc1234def56789a
terraform import "module.subnet.aws_subnet.this[\"subnet2-euwest1\"]" subnet-0def56789abc1234b


echo "======================================="
echo "Import process completed!"
echo "Run 'terraform plan' to verify the import"