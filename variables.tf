# variable "key_pair_name" {
#   type = string
#   default = "xyz"
  
# }

# variable "inst_type" {
#   type = string
#   default = "test"
  
# }

############################
variable "bucket_name" {
  type = string
  # sensitive = true
  default = "my-prod-terraform-state-bucket-0000"
  
}