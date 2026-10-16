resource "aws_instance" "name" {
    ami = "ami-0ed59cbb87dfa8dba"
    instance_type = "t3.micro"
    availability_zone = "us-east-1b"
    tags = {
        Name = "nit"
    }
}

resource "aws_s3_bucket" "my_bucket" {
    bucket = "jbheuhiheukbj"
}

#terraform plan -target=aws_s3_bucket.my_bucket #we can apply specific resource using target option. This will only create the s3 bucket and not the ec2 instance.