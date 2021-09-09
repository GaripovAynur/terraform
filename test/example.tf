# #----------------------------------------------------------
# # Provision Highly Availabe Web in any Region Default VPC
# # Create:
# #    - Security Group for Web Server открыть порты 80  и 43
# #    - Launch Configuration with Auto AMI Lookup
# #    - Auto Scaling Group using 2 Availability Zones
# #    - Classic Load Balancer in 2 Availability Zones
# #    - variables     provider "aws" { region = var.region } и т.д. lesson 12
# #    - varables dev.tfvars prod.tfvars lesson 13
#-----------------------------------------------------------
provider "aws" {
  region = var.region
}

#---------------------------------------------------------------------

resource "aws_default_subnet" "prod_subnet_1" {
  availability_zone = data.aws_availability_zones.available.names[0]
}
# #-------------------------------------------------------------------------

resource "aws_default_subnet" "prod_subnet_2" {
  availability_zone = data.aws_availability_zones.available.names[1]
}
#------------------------------------------------------------------------
resource "aws_key_pair" "key_for_webserver" {
  key_name   = "key_for_webserver"
  public_key = file("/home/garipe/.ssh/id_rsa.pub")
}
#-------------------------------------------------------------------------
resource "aws_launch_template" "my_webserver" {
  name_prefix            = "foobar"
  image_id               = data.aws_ami.my_webserver_ami.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.key_for_webserver.key_name
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  user_data              = base64encode(file("user_data.sh"))
  tags                   = var.common_tags
}
#----------------------------------------------------------------
resource "aws_autoscaling_group" "my_webserver" {
  desired_capacity    = 3
  max_size            = 4
  min_size            = 1
  health_check_type   = "ELB"
  vpc_zone_identifier = [aws_default_subnet.prod_subnet_1.id, aws_default_subnet.prod_subnet_2.id]
  load_balancers      = [aws_elb.bar.name]
  launch_template {
    id      = aws_launch_template.my_webserver.id
    version = "$Latest"
  }
}

#-------------------------------------------
resource "aws_elb" "bar" {
  name               = "foobar-terraform-elb"
  availability_zones = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1]]
  security_groups    = [aws_security_group.my_webserver.id]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }
  tags = var.common_tags
}
