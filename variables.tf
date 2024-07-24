variable "label_environment" {
  description = "Enviroment label"
  type        = string
}

variable "label_team" {
  description = "Team label"
  type        = string
}

variable "region" {
  description = "Region of VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "enable_vpc_multicast" {
  description = "Enable VPC multicast"
  type        = bool
  default     = false
}

variable "public_subnets" {
  description = "List of public subnets"
  type = map(object({
    cidr              = string
    availability_zone = string
    enable_multicast  = bool
  }))
}

variable "utility_subnets" {
  description = "List of utility subnets"
  type = map(object({
    cidr              = string
    availability_zone = string
    enable_multicast  = bool
  }))
}

variable "application_subnets" {
  description = "List of application subnets"
  type = map(object({
    cidr              = string
    availability_zone = string
    enable_multicast  = bool
  }))
}

variable "stateful_subnets" {
  description = "List of stateful subnets"
  type = map(object({
    cidr              = string
    availability_zone = string
    enable_multicast  = bool
  }))
}

variable "compliance_subnets" {
  description = "List of compliance subnets"
  type = map(object({
    cidr              = string
    availability_zone = string
    enable_multicast  = bool
  }))
}

variable "general_nat_ip" {
  description = "general NAT IPs"
  type = map(object({
    type = string
  }))
}

variable "application_nat_ip" {
  description = "application NAT IPs"
  type = map(object({
    type = string
  }))
}