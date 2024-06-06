variable "ami_image" {

  type = map(string)

  description = "This variable is to define the ami image name"

}

variable "vm_name" {

  type = list(string)

}

variable "instance_type" {

  type = string

}