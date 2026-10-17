module "Ailneni" {
  source = "../day6-ec2-modules"
  ami = "ami-0ed59cbb87dfa8dba"
  instance_type = "t3.micro"
    availability_zone = "us-east-1b"
}