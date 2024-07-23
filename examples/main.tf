module "tencent_vpc" {
  source = "../"

  region = "ap-jakarta"
  vpc_name = "emoney-vpc"
  vpc_cidr = "10.29.0.0/16"

  label_environment = "staging"
  label_team = "emoney"

  public_subnets = {
    "public-vm-1" = {
      cidr = "10.29.78.0/24",
      availability_zone = "ap-jakarta-1",
    },
    "public-vm-2" = {
      cidr = "10.29.79.0/24",
      availability_zone = "ap-jakarta-2",
    },
    "public-k8s-1" = {
      cidr = "10.29.66.0/23",
      availability_zone = "ap-jakarta-1",
    },
    "public-k8s-2" = {
      cidr = "10.29.68.0/23",
      availability_zone = "ap-jakarta-2",
    },
  }
  utility_subnets = {
    "utility-vm-1" = {
      cidr = "10.29.75.0/24",
      availability_zone = "ap-jakarta-1",
    },
    "utility-vm-2" = {
      cidr = "10.29.76.0/24",
      availability_zone = "ap-jakarta-2",
    },
    "utility-k8s-1" = {
      cidr = "10.29.60.0/23",
      availability_zone = "ap-jakarta-1",
    },
    "utility-k8s-2" = {
      cidr = "10.29.62.0/23",
      availability_zone = "ap-jakarta-2",
    },
  }
  application_subnets = {
    "application-vm-1" = {
      cidr = "10.29.72.0/24",
      availability_zone = "ap-jakarta-1",
    },
    "application-vm-2" = {
      cidr = "10.29.73.0/24",
      availability_zone = "ap-jakarta-2",
    },
    "application-k8s-1" = {
      cidr = "10.29.0.0/20",
      availability_zone = "ap-jakarta-1",
    },
    "application-k8s-2" = {
      cidr = "10.29.16.0/20",
      availability_zone = "ap-jakarta-2",
    },
  }
  stateful_subnets = {
    "stateful-vm-1" = {
      cidr = "10.29.48.0/22",
      availability_zone = "ap-jakarta-1",
    },
    "stateful-vm-2" = {
      cidr = "10.29.52.0/22",
      availability_zone = "ap-jakarta-2",
    },
  }
  compliance_subnets = {
    "compliance-vm-1" = {
      cidr = "10.29.81.0/24",
      availability_zone = "ap-jakarta-1",
    },
    "compliance-vm-2" = {
      cidr = "10.29.82.0/24",
      availability_zone = "ap-jakarta-2",
    },
  }

  reserved_nat_ip = 2
  general_nat_ip_count = 2
  application_nat_ip_count = 6
}
