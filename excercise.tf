provider "aws"{
 region = var.region
}

terraform{
 backend "s3"{
  bucket = "terraform-bucket"
  key = "terraform-state/terraform.tfstate"
  region = "eu-west-1"
 }
}

resource "aws_vpc" "terraform-vpc"{
 cidr_block = var.vpc_cidr

 tags = {
  Name = "terraform-vpc"
 }
}

resource "aws_subnet" "terraform-subnet"{
 count = length(data.aws_availability_zones.azs.names)
 vpc_id = aws_vpc.terraform-vpc.id
 cidr_block = element(var.subnet_cidr,count.index)

 tags = {
  Name = "subnet-count.index+1"
 }
}

resource "aws_s3" "terraform-bucket"{
 bucket = "terraform-state"
 acl = private

 tags = {
  Name  = "terraform-state"
  Description = "Backup of terraform state"
 }
}

resource "aws_instance" "terraform_ec2"{
 for_each = toset(var.subnet_cidr)
 ami = "ami-00ddb0e5626798373"
 type = "t2.micro"
 subnet = each.value
 tags = {
  Name = "terraform-ec2"
 }
 
 provisioner "local-exec" {
  command = "echo ${aws_instance.terraform_ec2.private_ip} >> ip_list.txt"
 # command = "echo ${aws_instance.terraform_ec2.arn} >> arn.txt"
 }
}
