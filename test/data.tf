data "aws_availability_zones" "available" {}

data "aws_vpcs" "my_vpcs" {}


data "aws_vpc" "prod_vpc" {}

data "aws_ami" "my_webserver_ami" {
  most_recent = true
  owners = ["137112412989"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}
