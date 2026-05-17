variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "Name prefix for the VPC module"
  type        = string
  default     = "Niranjan_VPC"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_subnet_az" {
  description = "Availability zone for the public subnet"
  type        = string
  default     = "us-east-1a"
}

variable "private_subnet_az" {
  description = "Availability zone for the private subnet"
  type        = string
  default     = "us-east-1a"
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c94855ba95c71c99"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    Project = "terraform-aws-ec2"
  }
}
