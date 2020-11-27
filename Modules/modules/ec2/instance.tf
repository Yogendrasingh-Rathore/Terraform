provider "aws"{
 region = var.region
}

resource "aws_instance" "terraform_ec2"{
 count = var.ec2_count
 ami = var.ami
 instance_type = var.instance_type
 subnet_id = element(var.subnet_cidr,count.index)
 tags = {
  Name = "terraform-ec2"
 }
}
