module "vpc" {
  source = "../../modules/vpc"

  name               = var.vpc_name
  cidr_block         = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.public_subnet_az
  tags               = var.tags
}

module "ec2_instance" {
  source = "../../modules/ec2_instance"

  name          = var.vpc_name
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnet_id
  vpc_id        = module.vpc.vpc_id
  tags          = var.tags
}
