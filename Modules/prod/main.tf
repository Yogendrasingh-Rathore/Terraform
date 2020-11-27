module "create_vpc" {
 source = "../modules/vpc"
 vpc_cidr = "192.168.0.0/16"
 subnet_cidr = ["192.168.4.0/24","192.168.5.0/24","192.168.6.0/24"]
 vpc_id = module.create_vpc.vpc_id
}

module "create_ec2" {
 source = "../modules/ec2"
 ec2_count = "3"
 ami = "ami-00ddb0e5626798373"
 instance_type = "t2.micro"
 subnet_cidr = module.create_vpc.subnet_cidr
}
