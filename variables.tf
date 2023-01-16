variable "region" {
  default = "us-east-2"  # Ohio the default region
}

variable "full_cidr_block" {
  default = "192.168.0.0/16"
}

variable "image_id" {
  #default ="ami-0acb95b8e72d78387"   # Ubuntu + Apache + Check.html + Java + maven
  #default = "ami-0ff39345bd62c82a5"  # Plain Ubuntu
  default = "ami-097b8d324a8715e47"   # AMI is from Packer Build Image Job
}