variable "name" {
  type        = string
  description = "Name prefix for VPC resources"
  default     = "niranjan"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  type        = string
  description = "Availability zone for the subnets"
  default     = "us-east-1a"
}

variable "tags" {
  type        = map(string)
  description = "Additional tags for VPC resources"
  default     = {
    Environment = "dev"
    Project     = "terraform-aws-ec2"
  }
}

