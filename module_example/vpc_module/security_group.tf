resource "aws_security_group" "public_security_group" {
  name        = "allow_public_traffic"
  description = "Allow traffic on public VM"
  vpc_id      = aws_vpc.myVpc.id

  dynamic "ingress" {

    for_each =  var.inbound_traffic

    content {

    description = ingress.value.description
    from_port   = ingress.value.from_port
    to_port     = ingress.value.to_port
    protocol    = ingress.value.protocol
    cidr_blocks = ingress.value.cidr_blocks
      
    }
    
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]


  }


  tags = {
    Name = "allow_public_traffic"
  }
}

resource "aws_security_group" "private_security_group" {
  name        = "allow_private_traffic"
  description = "Allow traffic on private VM"
  vpc_id      = aws_vpc.myVpc.id


  ingress {
    description = "TLS from Internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.subnet["public_subnet"].cidr_block]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]


  }


  tags = {
    Name = "allow_private_traffic"
  }
}
