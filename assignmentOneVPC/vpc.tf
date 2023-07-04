

resource "aws_vpc" "arshad-vpc" {
  cidr_block       = "172.16.0.0/23"
  instance_tenancy = "default"

  tags = {
    Name = "arshad-vpc"
  }
}


resource "aws_subnet" "arshad-public-subnet" {
  vpc_id     = aws_vpc.arshad-vpc.id
  cidr_block = "172.16.0.0/24"

  tags = {
    Name = "arshad-public-subnet"
  }
}

resource "aws_subnet" "arshad-private-subnet" {
  vpc_id     = aws_vpc.arshad-vpc.id
  cidr_block = "172.16.1.0/24"

  tags = {
    Name = "arshad-private-subnet"
  }
}