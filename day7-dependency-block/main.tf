resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  depends_on = [aws_s3_bucket.my_bucket]
}   


resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-terraform-bucket-127638"
}