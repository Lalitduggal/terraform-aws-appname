variable "cidr_block" {
    type = string
    default = "10.1.0.0/16"
    description = "CIDR block of VPC"
}


variable "instance_tenancy" {
    type = string
    default = "default"
    description = "Instance tenancy for VPC"
}


variable "vpc_name" {
    type = string
    default = "test03-vpc"
    description = "Name of the vpc"
}


variable "my_igw_name" {
    type = string
    default = "test03-igw"
    description = "Name of the igw"
}
