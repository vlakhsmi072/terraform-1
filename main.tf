terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "t1"

  instance_type          = "t2.micro"
  key_name               = "laxmi"
  monitoring             = true
  vpc_security_group_ids = ["sg-0ba55180433cd507d"]
  subnet_id              = "subnet-045c560cc21b39f10"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
