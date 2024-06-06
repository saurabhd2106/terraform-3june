module "vpc1" {

  source = "../vpc_module"

  vpc_name   = "vpc-saurabh"
  cidr_block = "20.0.0.0/16"


  subnet = {

    public_subnet = {

      cidr_block = "20.0.1.0/24"

      availability_zone = "us-east-1a"

    }

    private_subnet = {

      cidr_block = "20.0.2.0/24"

      availability_zone = "us-east-1b"

    }



  }

  inbound_traffic = {
    allow_http = {

      description = "TLS from Internet"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }

    allow_ssh = {

      description = "Http from Internet"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }


  }


  ec2_instance = {

    public_ec2 = {

      ami = "ami-07d9b9ddc6cd8dd30"

      instance_type = "t2.micro"

      key_name = "mykey-saurabh"

      availability_zone = "us-east-1a"

      subnet = "public_subnet"

      security_group = "public_sg"

      associate_public_ip_address = true

      user_data = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there! This is Saurabh’s public VM</h1></body></html>" > /var/www/html/index.html
        EOF

    }

    private_ec2 = {

      ami = "ami-07d9b9ddc6cd8dd30"

      instance_type = "t2.micro"

      subnet = "private_subnet"

      key_name = "mykey-saurabh"

      availability_zone = "us-east-1b"

      security_group = "private_sg"

      associate_public_ip_address = false

      user_data = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there! This is Saurabh’s public VM</h1></body></html>" > /var/www/html/index.html
        EOF

    }

  }


}

