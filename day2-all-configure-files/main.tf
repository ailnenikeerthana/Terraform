
resource "aws_subnet" "test" {
  vpc_id = aws_vpc.test.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "test_subnet"
  }
}

resource "aws_vpc" "test" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "test_vpc"
  }

}