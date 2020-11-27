variable "region" {
 default = "us-east-1"
}

variable "ec2_count" {
 default = "1" 
}

variable "ami" {
 default = "ami-00ddb0e5626798373"
}

variable "instance_type" {
 default = "t2.micro"
}

variable "subnet_cidr" {
 type = list
}
