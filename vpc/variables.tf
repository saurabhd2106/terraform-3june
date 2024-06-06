variable "vpc_name" {

  type        = string
  description = "This is a variable to define a vpc name"

}

variable "cidr_block" {

  type = string

  default = "10.0.0.0/16"

}

variable "public_subnet_cidr" {

  type = string

  default = "10.0.1.0/24"

}

variable "private_subnet_cidr" {

  type = string

  default = "10.0.2.0/24"

}

variable "public_subnet_az" {

  type = string

  default = "us-east-1a"

}

variable "private_subnet_az" {

  type = string

  default = "us-east-1b"

}

