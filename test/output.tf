
output "latest_ubuntu_ami_id" {
  value = data.aws_ami.my_webserver_ami.id
}

output "prod_vpc_id" {
  value = data.aws_vpc.prod_vpc.id
}

output "prod_vpc_cidr" {
  value = data.aws_vpc.prod_vpc.cidr_block
}

output "aws_vpcs" {
  value = data.aws_vpcs.my_vpcs.ids
}

output "aws_availability_zones_0" {
  value = data.aws_availability_zones.available.names[0]
}

output "aws_availability_zones_1" {
  value = data.aws_availability_zones.available.names[1]
}

output "aws_launch_template_latest_version" {
  value = aws_launch_template.my_webserver.latest_version # resource не нужно писать
}

output "aws_launch_template_arn" {
  value = aws_launch_template.my_webserver.arn
}

output "aws_elb_bar_dns_name" {
  value = aws_elb.bar.dns_name
}

output "aws_elb_bar_subnets" {
  value = aws_elb.bar.subnets
}
