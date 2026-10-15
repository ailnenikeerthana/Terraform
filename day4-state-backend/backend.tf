terraform {
  backend "s3" {
    bucket         = "backendddddd-s3"
    key            = "environment/production/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
