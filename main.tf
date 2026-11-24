module "network" {
  source = "./modules/vpc"

  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "ec2" {
  source = "./modules/ec2"

  subnet_id         = module.network.public_subnet_id
  security_group_id = module.network.security_group_id
  instance_type     = var.instance_type
  ami_id            = var.ami_id
}
