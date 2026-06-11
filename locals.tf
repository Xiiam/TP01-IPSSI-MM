locals {
  name_prefix = "${var.project_name}-${var.environment}"

  public_subnets = {
    for idx, az in var.azs : az => cidrsubnet(var.vpc_cidr, 8, idx + 1)
  }

  private_subnets = {
    for idx, az in var.azs : az => cidrsubnet(var.vpc_cidr, 8, idx + 101)
  }
}

locals {
  web_subnets = { for k, s in aws_subnet.private : k => s.id }
}
