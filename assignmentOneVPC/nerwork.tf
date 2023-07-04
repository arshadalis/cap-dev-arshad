

resource "aws_internet_gateway" "arshad-igw" {
  vpc_id = aws_vpc.arshad-vpc.id
  tags = {
    Name = "arshad-igw"
  }
}


resource "aws_route_table" "arshad-public-crt" {
  vpc_id = aws_vpc.arshad-vpc.id

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.arshad-igw.id
  }

  tags = {
    Name = "arshad-public-crt"
  }
}

resource "aws_route_table_association" "arshad-crta-public-subnet-1"{
  subnet_id = aws_subnet.arshad-public-subnet.id
  route_table_id = aws_route_table.arshad-public-crt.id
}


resource "aws_security_group" "nginx-ingress-allowed" {
  vpc_id = aws_vpc.arshad-vpc.id

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  //If you do not add this rule, you can not reach the NGIX
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "nginx-ingress-allowed"
  }
}