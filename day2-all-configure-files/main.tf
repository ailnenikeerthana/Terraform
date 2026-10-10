
resource "aws_subnet" "test" {
  vpc_id = aws_vpc.test.id
  cidr_block = var.subnet_cidr
  tags = {
    Name = "test_subnet"
  }
}

resource "aws_vpc" "test" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "test_vpc"
  }

}