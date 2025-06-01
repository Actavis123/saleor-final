variable "aws_region" { default = "us-east-1" }
variable "availability_zone" { default = "us-east-1a" }
variable "vpc_cidr" { default = "10.0.0.0/16" }
variable "public_subnet_cidr" { default = "10.0.1.0/24" }
variable "ami_id" { default = "ami-0fc5d935ebf8bc3bc" } # Ubuntu 22.04
variable "instance_type" { default = "t2.micro" }
