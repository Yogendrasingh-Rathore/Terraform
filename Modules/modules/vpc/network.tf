provider "aws"{
 region = var.region
}

resource "aws_vpc" "terraform-vpc"{
 cidr_block = var.vpc_cidr

 tags = {
  Name = "terraform-vpc"
 }
}

data "aws_availability_zones" "azs"{}


resource "aws_subnet" "terraform-subnet"{
 count = length(var.subnet_cidr)
 vpc_id = var.vpc_id
 cidr_block = element(var.subnet_cidr,count.index)

 tags = {
  Name = "subnet-${count.index+1}"
 }
}

output "vpc_id"{
 value = aws_vpc.terraform-vpc.id
}

output "subnet_cidr"{
 value = aws_subnet.terraform-subnet[*].id
}
