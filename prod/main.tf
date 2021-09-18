module "my_vpc" {
    source = "git::https://github.com/Lalitduggal/terraform-aws-monorepo.git//vpc"

    cidr_block       = var.cidr_block
    instance_tenancy = var.instance_tenancy
    vpc_name = var.vpc_name
}
