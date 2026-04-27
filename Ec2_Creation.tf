# Configure AWS Provider
provider "aws" {
  region = "ap-south-1" # You can change it to your preferred region
}

resource "aws_instance" "pathnex" {
  ami                    = "ami-0f559c3642608c138"
  instance_type          = "t3.micro" # You can change it according to your need
  count                  = 1
  key_name               = "Pathnex-Kubernetes" # change if key name is different in aws account
  subnet_id              = "subnet-0c794e612ad601693" # Change it with your subnet id
  vpc_security_group_ids = ["sg-020de4ff81e280c7e"] # Change it with your security group
  tags = {
    Name = "Pathnex-Ec2-26"
  }
}

output "ec2_public_ips" {
  value = aws_instance.pathnex[*].public_ip
}