variable "web_instance_type" {
    default="t2.micro"
    }
variable "ami_id" {
    default="ami-0e820afa569e84cc1"
    }
    output "instace_pub" {
    value = aws_instance.ec2_module_1.public_ip
  
}
