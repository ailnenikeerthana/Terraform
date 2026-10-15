resource "aws_instance" "name" {
  ami = "ami-097855b862d5b1eb2"
  instance_type = "t3.micro"
  availability_zone = "us-east-1a"
  tags = {
    Name = "test_instance"
  }
}

