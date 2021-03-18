provider "aws" {
  access_key = "AKIAUOABTBSCSUJSRPWJ"
  secret_key = "q6f38BtA$MJtz5T844swY2zWAygtmFe0fp+uylEzbU9rtU7R"
  region     = "us-east-2"
}

resource "aws_instance" "my_Ubuntu" {
  count         = 3
  ami           = "ami-08962a4068733a2b6"
  instance_type = "t3.micro"
}
