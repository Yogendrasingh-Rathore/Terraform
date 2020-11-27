module "create_vpc" {
 source = "../modules/vpc"
 vpc_cidr = "192.168.0.0/16"
 subnet_cidr = ["192.168.1.0/24","192.168.2.0/24","192.168.3.0/24"]
 vpc_id = module.create_vpc.vpc_id
}

module "create_ec2" {
 source = "../modules/ec2"
 ec2_count = "2"
 ami = "ami-00ddb0e5626798373"
 instance_type = "t2.micro"
 subnet_cidr = module.create_vpc.subnet_cidr
}
