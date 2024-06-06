resource "aws_instance" "myVm1" {

  ami = var.ami_image["useast1"]

  instance_type = var.instance_type

  tags = {
    Name = "saurabh-vm"
  }


}

resource "aws_instance" "myVm2" {

  ami = var.ami_image["useast2"]

  provider = aws.useast2

  instance_type = var.instance_type

  tags = {
    Name = "saurabh-vm-2"
  }


}
