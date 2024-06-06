resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.myVpc.id

  cidr_block = var.public_subnet_cidr

  availability_zone = var.public_subnet_az

  tags = {
    Name = "pubic_subnet"
  }

 

}

resource "aws_subnet" "private_subnet" {

  vpc_id = aws_vpc.myVpc.id

  cidr_block = var.private_subnet_cidr

  availability_zone = var.private_subnet_az

  tags = {
    Name = "private_subnet"
  }

}