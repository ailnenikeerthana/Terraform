resource "aws_instance" "name" {
    ami = "ami-0ed59cbb87dfa8dba"
    instance_type = "t3.micro"
    availability_zone = "us-east-1b"
    tags = {
        Name = "nit"
    }

    lifecycle {
        ignore_changes = [tags]
        create_before_destroy = true
        prevent_destroy = true
}
}