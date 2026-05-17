# Devops_Task

Jenkins and Git Hub integration

## Terraform Project Structure

This repository contains a Terraform project with the following structure:

- `main.tf`: Main Terraform configuration file
- `variables.tf`: Variable definitions
- `outputs.tf`: Output definitions
- `providers.tf`: Provider configurations
- `terraform.tfvars`: Variable values (add sensitive values here)
- `.gitignore`: Git ignore file for Terraform files

### Environments

- `environments/dev/`: Development environment configurations
  - `main.tf`: Dev-specific resources
  - `variables.tf`: Dev variables
  - `terraform.tfvars`: Dev variable values

- `environments/prod/`: Production environment configurations
  - `main.tf`: Prod-specific resources
  - `variables.tf`: Prod variables
  - `terraform.tfvars`: Prod variable values

### Modules

- `modules/vpc/`: VPC module
  - `main.tf`: VPC, subnet, internet gateway, route table
  - `variables.tf`: VPC module inputs
  - `outputs.tf`: VPC module outputs

- `modules/ec2_instance/`: EC2 module
  - `main.tf`: EC2 instance and security group
  - `variables.tf`: EC2 module inputs
  - `outputs.tf`: EC2 module outputs

## Usage

1. Initialize Terraform: `terraform init`
2. Plan changes: `terraform plan`
3. Apply changes: `terraform apply`

For environment-specific deployments:
- `cd environments/dev`
- `terraform init`
- `terraform plan -var-file=terraform.tfvars`
- `terraform apply -var-file=terraform.tfvars`
