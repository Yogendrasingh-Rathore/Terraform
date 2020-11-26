variable "region" {
 default = "us-east-1"
}

variable "vpc_cidr" {
 default = "190.172.0.0/24" 
}

variable "subnet_cidr" {
 type = list
 default = ["190.172.0.0/28","190.172.1.0/28","190.172.2.0/28"]
}

variable "azs" {
 type = list
 default = ["us-east-1a","us-east-1b","us-east-1c"]
}
