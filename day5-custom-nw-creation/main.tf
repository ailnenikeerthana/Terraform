#Creation of VPC
resource "aws_vpc" "Terraform_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "Terraform_vpc"
    }
}

#Creation of Subnet
resource "aws_subnet" "subnet_1" {
    vpc_id = aws_vpc.Terraform_vpc.id
    cidr_block = "10.0.0.0/24"
    tags = {
        Name = "subnet_1"
    }
}

resource "aws_subnet" "subnet_2" {
    vpc_id = aws_vpc.Terraform_vpc.id
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "subnet_2"
    }
}

#Creation of Internet Gateway
resource "aws_internet_gateway" "Terraform_igw" {
    vpc_id = aws_vpc.Terraform_vpc.id
    tags = {
        Name = "Terraform_igw"
    }
} 

#Creation of Route Table
resource "aws_route_table" "Terraform_rt" {
    vpc_id = aws_vpc.Terraform_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.Terraform_igw.id
    }
}
#Creation of Route Table Association
resource "aws_route_table_association" "Terraform_rta_1"{
    subnet_id = aws_subnet.subnet_1.id
    route_table_id = aws_route_table.Terraform_rt.id
}
#Creation of Security Group
resource "aws_security_group" "Terraform_sg" {
    name = "Terraform_sg"
    description = "Allow SSH and HTTP"
    vpc_id = aws_vpc.Terraform_vpc.id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0 #any port
        to_port     = 0 
        protocol    = "-1" #any protocol
        cidr_blocks = ["0.0.0.0/0"] #any source
    }
}

#Creation of EC2 Instance
resource "aws_instance" "Terraform_instance" {
    ami = "ami-0ed59cbb87dfa8dba"
    instance_type = "t3.small"
    availability_zone = "us-east-1e"
    subnet_id = aws_subnet.subnet_1.id
    vpc_security_group_ids = [aws_security_group.Terraform_sg.id]
    }

#creation of nat gateway
resource "aws_nat_gateway" "Terraform_nat_gw" {
    connectivity_type = "private"
    subnet_id = aws_subnet.subnet_2.id
}