output "ec2_info"{
# filter
 value = aws_instance.terraform_ec2.public_ip
}

output "s3_info"{
 value = aws_s3.terraform-bucket.version
}
