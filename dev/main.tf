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

    
module "my_public_subnet_module" {
    source = "git::https://github.com/Lalitduggal/terraform-aws-modules-monorepo.git//public-subnet"

    my_public_subnet_vpc_id = module.my_vpc_module.my_vpc_id
    my_public_subnet_cidr_block       = var.my_public_subnet_cidr_block
    my_pubic_subnet_name       = var.my_public_subnet_name

}
