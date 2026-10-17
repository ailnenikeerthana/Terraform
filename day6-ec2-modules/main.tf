resource "aws_instance" "name" {
  ami = var.ami
  instance_type = var.instance_type
  availability_zone = var.availability_zone
  tags = var.tags
}
resource "aws_s3_bucket" "my_bucket" {
  bucket = "jbheuhiheukbj"
}