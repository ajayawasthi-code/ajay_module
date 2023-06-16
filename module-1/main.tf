resource "aws_instance" "ec2_module_1" {
  ami=var.ami_id
  instance_type=var.web_instance_type
  key_name="developer1"
  vpc_security_group_ids=[aws_security_group.main.id]

  user_data=<<-EOF
      #!/bin/sh
      sudo yum update -y
      sudo yum install -y httpd
      sudo systemctl status httpd
      sudo systemctl start httpd
      sudo chown -R $USER:$USER /var/www/html
      sudo echo "<html><body><h1>Hello this is module1 </h1></body></html>" > /var/www/html/index.html
      EOF
}
resource "aws_security_group" "main" {
   name="EC2-webserver-SG-1"
   description="Webserver for EC2 Instances"

ingress {

description="Allow inbound from"
from_port=22
to_port=22
protocol="tcp"
cidr_blocks=["0.0.0.0/0"]
}

ingress {

from_port=80
to_port=80
protocol="tcp"
cidr_blocks=["0.0.0.0/0"]

}

egress {
from_port=0
to_port=0
protocol="-1"
cidr_blocks=["0.0.0.0/0"]


}
}



resource "aws_key_pair" "developer1" {

  key_name   = "developer1"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCr3g7rEmzVwfjY1VGMQJkKifVvVO6Yw50BrhiUQg3UJZmSsxbjlGkuEe3yB5UUIPLzeD4IKHoAsb4JhtQmzl+uPtMXe+Mict//jQc2Zgq00xl3lsNRuAvNcsl7ppkN9q2noTzvKCdkgOeg2npkSgKmWHfr070xn5LI2UOrn3hEA7ApM605Nq2l8gWoWcEm7LjXDFCeQsfdApbru6lAGCxYSm821g/vxPcd1eltymjS2b+XI/G7+PVEJJN/+iRMFuovEzyVfI51T9qABmb6qjmRzMBrgSrpXR9HiTwnzlMAySQsn1T1dYimgNzNNz3crrWlV1T3oYQVc+O8DlMitdX3y5EZbT40rcEny6Ydv4sGYBiZoKq4Y1ZvtvY8jIZxc/gcwmcEmqyttsaWU6rXK8QEqkeOqMDYE7H6a3qpPK4PTBxrJptdG4qjCmnq8HvUOiZ8ckROqh7NKqgfXyoKDRmqmsda0lLJVMalhLYfn7yehRo+wDQYBAxmW+ED9bgBqps= root@ip-172-31-33-173.us-east-2.compute.internal"
}
