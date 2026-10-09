resource "aws_vpc" "Test" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "My VPC"
  }
}
