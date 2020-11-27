output "ec2_info"{
 value = aws_instance.terraform_ec2.public_ip
}

output "s3_info"{
 value = aws_s3_bucket.terraform-bucket.versioning
}
