resource "aws_instance" "myVm1" {


  for_each = var.vm_name

  ami = var.ami_image

  instance_type = var.instance_type

  tags = {
    Name = each.value
  }


}