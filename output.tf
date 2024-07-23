output "vpc_name" {
  description = "VPC name"
  value       = tencentcloud_vpc.vpc.name
}

output "private_dns_name" {
  description = "private DNS name"
  value       = tencentcloud_private_dns_zone.private_dns.domain
}

output "utility_subnet_ids" {
  description = "Utility subnet IDs"
  value       = values(tencentcloud_subnet.utility_subnets).*.id
}

output "application_subnet_ids" {
  description = "Application subnet IDs"
  value       = values(tencentcloud_subnet.application_subnets).*.id
}

output "stateful_subnet_ids" {
  description = "Stateful subnet IDs"
  value       = values(tencentcloud_subnet.stateful_subnets).*.id
}

output "compliance_subnet_ids" {
  description = "Compliance subnet IDs"
  value       = values(tencentcloud_subnet.compliance_subnets).*.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = values(tencentcloud_subnet.public_subnets).*.id
}

output "utility_subnet_cidr" {
  description = "Utility subnet CIDR"
  value       = values(tencentcloud_subnet.utility_subnets).*.cidr_block
}

output "application_subnet_cidr" {
  description = "Application subnet CIDR"
  value       = values(tencentcloud_subnet.application_subnets).*.cidr_block
}

output "stateful_subnet_cidr" {
  description = "Stateful subnet CIDR"
  value       = values(tencentcloud_subnet.stateful_subnets).*.cidr_block
}

output "compliance_subnet_cidr" {
  description = "Compliance subnet CIDR"
  value       = values(tencentcloud_subnet.compliance_subnets).*.cidr_block
}

output "public_subnet_cidr" {
  description = "Public subnet CIDR"
  value       = values(tencentcloud_subnet.public_subnets).*.cidr_block
}

output "nat_general_addresses" {
  description = "NAT general addresses"
  value       = tencentcloud_eip.general_nat_eip.*.public_ip
}

output "nat_application_addresses" {
  description = "NAT application addresses"
  value       = tencentcloud_eip.application_nat_eip.*.public_ip
}

output "nat_reserved_addresses" {
  description = "NAT reserved addresses"
  value       = tencentcloud_eip.reserved_nat_ip.*.public_ip
}
