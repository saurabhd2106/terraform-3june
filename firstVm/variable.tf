variable "ami_image" {

  type = string

  description = "This variable is to define the ami image name"

  default = "ami-04b70fa74e45c3917"

}

variable "vm_name" {

  type = string

}

variable "instance_type" {

  type = string

}