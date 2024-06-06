resource "aws_instance" "myVm1" {


  # count = 3
  count = length(var.vm_name)

  ami = var.ami_image

  instance_type = var.instance_type

  tags = {
   # Name = "ec2-${var.vm_name}-${count.index}"

   Name = var.vm_name[count.index]
  }


}