output "vpc_name" {
  description = "VPC name"
  value       = module.tencent_vpc.vpc_name
}

output "vpc_id" {
  description = "VPC id"
  value       = module.tencent_vpc.vpc_id
}

output "private_dns_name" {
  description = "private DNS name"
  value       = module.tencent_vpc.private_dns_name
}

output "utility_subnet_ids" {
  description = "Utility subnet IDs"
  value       = module.tencent_vpc.utility_subnet_ids
}

output "application_subnet_ids" {
  description = "Application subnet IDs"
  value       = module.tencent_vpc.application_subnet_ids
}

output "stateful_subnet_ids" {
  description = "Stateful subnet IDs"
  value       = module.tencent_vpc.stateful_subnet_ids
}

output "compliance_subnet_ids" {
  description = "Compliance subnet IDs"
  value       = module.tencent_vpc.compliance_subnet_ids
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.tencent_vpc.public_subnet_ids
}

output "utility_subnets_cidr" {
  description = "Utility subnet CIDR"
  value       = module.tencent_vpc.utility_subnets_cidr
}

output "application_subnets_cidr" {
  description = "Application subnet CIDR"
  value       = module.tencent_vpc.application_subnets_cidr
}

output "stateful_subnets_cidr" {
  description = "Stateful subnet CIDR"
  value       = module.tencent_vpc.stateful_subnets_cidr
}

output "compliance_subnets_cidr" {
  description = "Compliance subnet CIDR"
  value       = module.tencent_vpc.compliance_subnets_cidr
}

output "public_subnets_cidr" {
  description = "Public subnet CIDR"
  value       = module.tencent_vpc.public_subnets_cidr
}

output "nat_general_addresses" {
  description = "NAT general addresses"
  value       = module.tencent_vpc.nat_general_addresses
}

output "nat_application_addresses" {
  description = "NAT application addresses"
  value       = module.tencent_vpc.nat_application_addresses
}
