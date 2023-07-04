

resource "aws_instance" "nginx-server" {
  ami                         = "ami-0d361301d8f7067d5"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.arshad-public-subnet.id
  tags                        = { Name = "arshad-instance"}
  vpc_security_group_ids      = [aws_security_group.nginx-ingress-allowed.id]
  associate_public_ip_address = true
  user_data                   = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    service nginx start
  EOF
}