provider "aws" {
  access_key = "AKIAUOABTBSCSUJSRPWJ"
  secret_key = "qM6f38BtA$Jtz5T844swY2zWAygtmFe0fp+uylEzbU9rtU7R"
  region     = "us-east-2"
}

resource "aws_instance" "my_Ubuntu" {
  count         = 3
  ami           = "ami-08962a4068733a2b6"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  user_data = <<EOF
#!/bin/bash
sudo yum - y update
sudo yum -y install nginx
echo "Privet" > /var/www/html/index.html
sudo systemctl start nginx
EOF

tags {
  owner = "Garipov Aynur"
  Name = "MyFirst_webSite_terraform"
  }
}

resource "aws_security_group" "my_webserver." {
  description = "Garipov Aynur"
  name = "MyFirst_webSite_terraform"

  ingress {
   description = "TLS from VPC"
   from_port   = 443
   to_port     = 443
   protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

 }
 ingress {
  description = "TLS from VPC"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
 cidr_blocks = ["0.0.0.0/0"]
}


 egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }

 tags = {
   Name = "allow_tls"
 }
}  
