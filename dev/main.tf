module "my_vpc_module" {
    source = "git::https://github.com/Lalitduggal/terraform-aws-modules-monorepo.git//vpc"

    cidr_block       = var.cidr_block
    instance_tenancy = var.instance_tenancy
    vpc_name = var.vpc_name
}

    
module "my_igw_module" {
    source = "git::https://github.com/Lalitduggal/terraform-aws-modules-monorepo.git//igw"

    my_igw_name       = var.my_igw_name
    my_igw_vpc_id = module.my_vpc_module.my_vpc_id

}

    
module "my_public_subnet" {
    source = "git::https://github.com/Lalitduggal/terraform-aws-modules-monorepo.git//public-subnet"

    vpc_id = module.my_vpc_module.my_vpc_id
    cidr_block       = var.my_public_subnet_cidr_block

}
