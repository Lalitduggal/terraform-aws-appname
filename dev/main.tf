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
    my_public_subnet_name       = var.my_public_subnet_name

}

    
module "my_public_subnet_route_table_module" {
    source = "git::https://github.com/Lalitduggal/terraform-aws-modules-monorepo.git//public-route-table"

    my_public_subnet_route_table_vpc_id = module.my_vpc_module.my_vpc_id
    my_public_subnet_route_table_name       = var.my_public_subnet_route_table_name
        
}
    

module "my_public_subnet_route_table_association_module" {
    source = "git::https://github.com/Lalitduggal/terraform-aws-modules-monorepo.git//public-route-table-association"

    my_public_subnet_route_table_id = module.my_public_subnet_route_table_module.my_public_subnet_route_table_id
    my_public_subnet_id       = module.my_public_subnet_module.my_public_subnet_id
        
}
        
        
module "route_module" {
    source = "git::https://github.com/Lalitduggal/terraform-aws-modules-monorepo.git//route"

    public_subnet_route_table_id = module.my_public_subnet_route_table_module.my_public_subnet_route_table_id
    destination_cidr_block = var.route_for_igw_destination_cidr_block
    igw_id       = module.my_igw_module.my_igw_id
        
}
