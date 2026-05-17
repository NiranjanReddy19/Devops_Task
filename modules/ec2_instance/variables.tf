variable "name" {
  type        = string
  description = "Name prefix for the EC2 module"
  default     = "demo"
}

variable "ami" {
  type        = string
  description = "AMI ID for the EC2 instance"
  default     = "ami-0c94855ba95c71c99" # Replace with a valid AMI in your region
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the EC2 instance"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the EC2 instance is launched"
}

variable "tags" {
  type        = map(string)
  description = "Additional tags for EC2 resources"
  default     = {
    name = "demo-ec2-instance"
    Project = "Terraform"
  }
}
