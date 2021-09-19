module "my_vpc_module" {
    source = "git::https://github.com/Lalitduggal/terraform-aws-modules-monorepo.git//vpc"

    cidr_block       = var.cidr_block
    instance_tenancy = var.instance_tenancy
    vpc_name = var.vpc_name
}

    
module "my_vpc_module" {
    source = "git::https://github.com/Lalitduggal/terraform-aws-modules-monorepo.git//igw"

    my_igw_name       = var.my_igw_name
    my_igw_vpc_id = var.my_igw_vpc_id

}
