output "vpc_name" {
  description = "VPC name"
  value       = tencentcloud_vpc.vpc.name
}

output "private_dns_name" {
  description = "private DNS name"
  value       = tencentcloud_private_dns_zone.private_dns.domain
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
