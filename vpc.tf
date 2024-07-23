resource "tencentcloud_vpc" "vpc" {
  name       = var.vpc_name
  cidr_block = var.vpc_cidr

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "tencentcloud_route_table" "application_route_table" {
  vpc_id = tencentcloud_vpc.vpc.id
  name   = "application"

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "tencentcloud_subnet" "application_subnets" {
  for_each = var.application_subnets

  vpc_id            = tencentcloud_vpc.vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.availability_zone
  name              = each.key

  route_table_id = tencentcloud_route_table.application_route_table.id

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "tencentcloud_route_table" "utility_route_table" {
  vpc_id = tencentcloud_vpc.vpc.id
  name   = "utility"

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "tencentcloud_subnet" "utility_subnets" {
  for_each = var.utility_subnets

  vpc_id            = tencentcloud_vpc.vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.availability_zone
  name              = each.key

  route_table_id = tencentcloud_route_table.utility_route_table.id

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "tencentcloud_route_table" "public_route_table" {
  vpc_id = tencentcloud_vpc.vpc.id
  name   = "public"

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "tencentcloud_subnet" "public_subnets" {
  for_each = var.public_subnets

  vpc_id            = tencentcloud_vpc.vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.availability_zone
  name              = each.key

  route_table_id = tencentcloud_route_table.public_route_table.id

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "tencentcloud_route_table" "stateful_route_table" {
  vpc_id = tencentcloud_vpc.vpc.id
  name   = "stateful"

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "tencentcloud_subnet" "stateful_subnets" {
  for_each = var.stateful_subnets

  vpc_id            = tencentcloud_vpc.vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.availability_zone
  name              = each.key

  route_table_id = tencentcloud_route_table.stateful_route_table.id

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "tencentcloud_route_table" "compliance_route_table" {
  vpc_id = tencentcloud_vpc.vpc.id
  name   = "compliance"

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "tencentcloud_subnet" "compliance_subnets" {
  for_each = var.compliance_subnets

  vpc_id            = tencentcloud_vpc.vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.availability_zone
  name              = each.key

  route_table_id = tencentcloud_route_table.compliance_route_table.id

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "tencentcloud_eip" "general_nat_eip" {
  count = var.general_nat_ip_count

  name = "general-nat-eip-${count.index + 1}"
  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "tencentcloud_nat_gateway" "general_nat" {
  name   = "general-nat"
  vpc_id = tencentcloud_vpc.vpc.id

  assigned_eip_set = [
    for eip in tencentcloud_eip.general_nat_eip : eip.public_ip
  ]
  nat_product_version = 2
  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
  lifecycle {
    ignore_changes = [
      bandwidth,
      max_concurrent,
    ]
  }
}

resource "tencentcloud_eip" "application_nat_eip" {
  count = var.application_nat_ip_count

  name = "application-nat-eip-${count.index + 1}"
  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "tencentcloud_nat_gateway" "application_nat" {
  name   = "application-nat"
  vpc_id = tencentcloud_vpc.vpc.id

  assigned_eip_set = [
    for eip in tencentcloud_eip.application_nat_eip : eip.public_ip
  ]
  nat_product_version = 2
  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
  lifecycle {
    ignore_changes = [
      bandwidth,
      max_concurrent,
    ]
  }
}

resource "tencentcloud_eip" "reserved_nat_ip" {
  count = var.reserved_nat_ip

  name = "reserved-nat-eip-${count.index + 1}"
  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}

resource "tencentcloud_route_entry" "rtb_application_default_gateway" {
  vpc_id         = tencentcloud_route_table.application_route_table.vpc_id
  route_table_id = tencentcloud_route_table.application_route_table.id
  cidr_block     = "0.0.0.0/0"
  next_type      = "nat_gateway"
  next_hub       = tencentcloud_nat_gateway.application_nat.id
}

resource "tencentcloud_route_entry" "rtb_utility_default_gateway" {
  vpc_id         = tencentcloud_route_table.utility_route_table.vpc_id
  route_table_id = tencentcloud_route_table.utility_route_table.id
  cidr_block     = "0.0.0.0/0"
  next_type      = "nat_gateway"
  next_hub       = tencentcloud_nat_gateway.general_nat.id
}

resource "tencentcloud_route_entry" "rtb_public_default_gateway" {
  vpc_id         = tencentcloud_route_table.public_route_table.vpc_id
  route_table_id = tencentcloud_route_table.public_route_table.id
  cidr_block     = "0.0.0.0/0"
  next_type      = "nat_gateway"
  next_hub       = tencentcloud_nat_gateway.general_nat.id
}

resource "tencentcloud_route_entry" "rtb_stateful_default_gateway" {
  vpc_id         = tencentcloud_route_table.stateful_route_table.vpc_id
  route_table_id = tencentcloud_route_table.stateful_route_table.id
  cidr_block     = "0.0.0.0/0"
  next_type      = "nat_gateway"
  next_hub       = tencentcloud_nat_gateway.general_nat.id
}

resource "tencentcloud_route_entry" "rtb_compliance_default_gateway" {
  vpc_id         = tencentcloud_route_table.compliance_route_table.vpc_id
  route_table_id = tencentcloud_route_table.compliance_route_table.id
  cidr_block     = "0.0.0.0/0"
  next_type      = "nat_gateway"
  next_hub       = tencentcloud_nat_gateway.general_nat.id
}

resource "tencentcloud_private_dns_zone" "private_dns" {
  domain = "${var.vpc_name}.internal."

  vpc_set {
    region      = var.region
    uniq_vpc_id = tencentcloud_vpc.vpc.id
  }

  dns_forward_status   = "DISABLED"
  cname_speedup_status = "ENABLED"

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }
}