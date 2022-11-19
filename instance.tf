resource "aws_instance" "web-server-for-eks-master" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet  --> andrey-public-sub-1c
  subnet_id = "subnet-0fee2d1c9e08f1996"

  # the security group
  vpc_security_group_ids = ["sg-04f2d5d1786a702f1"]

  # the public SSH key
  key_name = "andrey-key-frankfurt"

  # the server name in AWS
  tags = {
    Name = "andrey-eks-master"
  }

  # Creating the HOST file for Ansible
   provisioner "local-exec" {
     command = <<EOF
       echo web1 ansible_host=${aws_instance.web-server-for-eks-master.private_ip} ansible_connection=ssh ansible_user=ubuntu ansible_become=yes>> hosts
       echo [web_servers] >>hosts
       echo web1 >> hosts
     EOF
  }

}
