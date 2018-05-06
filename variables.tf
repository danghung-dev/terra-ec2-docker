variable "aws_region" {
  description = "EC2 Region for the VPC"
  default     = "ap-southeast-1"
}

variable "aws_key_name" {}

variable "amis" {
  description = "AMIs by region"

  default = {
    ap-southeast-1 = "ami-52d4802e" # ubuntu 16.04 LTS
  }
}

variable "availability_zone" {}
variable "vpc_security_group_ids" {}
variable "subnet_id" {}
variable "instance_type" {}
