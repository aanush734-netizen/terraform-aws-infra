output "vpc_id" {
  value = module.network.vpc_id
}

output "public_ip" {
  value = module.ec2.public_ip
}
