# resource "aws_instance" "first-ec2" {
#   count = 10
#   ami = "ami-020cba7c55df1f615"
#   instance_type = "t2.micro"
#   key_name = "xyz"

#   tags = {
#     Name = "HelloWorld"

#   }
# }

#####################
# locals {
#   my_ami = "ami-020cba7c55df1f615"
#   my_instance_type = "t2.micro"
# }

# resource "aws_instance" "first-ec2" {
#   ami = local.my_ami
#   instance_type = local.my_instance_type
#   key_name = "xyz"

#   tags = {
#     Name = "HelloWorld"

#   }
# }

#######################
# locals {
#   my_ami = "ami-020cba7c55df1f615"
  
# }

# resource "aws_instance" "first-ec2" {
#   ami = local.my_ami
#   instance_type = var.inst_type
#   key_name = var.key_pair_name

#   tags = {
#     Name = "HelloWorld"

#   }
# }

#################################

resource "aws_s3_bucket" "backend-s3" {
  bucket = var.bucket_name

}

resource "aws_s3_bucket_versioning" "enable_versioning" {
  bucket = aws_s3_bucket.backend-s3.id
  versioning_configuration {
    status = "Enabled"
  }
  # depends_on = [ aws_s3_bucket.backend-s3 ]
  
}

resource "aws_s3_bucket_server_side_encryption_configuration" "enable_sse" {
  bucket = aws_s3_bucket.backend-s3.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}