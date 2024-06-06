variable "vpc_name" {

  type        = string
  description = "This is a variable to define a vpc name"

}

variable "cidr_block" {

  type = string

  default = "10.0.0.0/16"

}



variable "subnet" {

  type = any
  
}

variable "inbound_traffic" {

  type = any

  
}

variable "ec2_instance" {

  type = any
  
}