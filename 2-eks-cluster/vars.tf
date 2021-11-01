variable "AWS_REGION" {
  default = "eu-central-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "aws_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "aws_key.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    eu-central-1 = "ami-05f7491af5eef733a" 
  }
}

variable "spotprice" {
  default = "0.20"
}

variable "spot_type" {
  default = "persistent"
}

variable "instance_type" {
  default = "t2.micro" 
}

variable "demo_dns_zone" {
} 

variable "demo_dns_name" {
  default     = "demo-ssl"
}
