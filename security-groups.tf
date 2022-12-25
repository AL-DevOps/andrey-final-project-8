resource "aws_security_group" "node_group_one" {
  name_prefix = "node_group_one"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
    ]
  }
   ingress {
   description      = "apps"
   from_port        = 8080
   to_port          = 8080
   protocol         = "tcp"
   cidr_blocks      = ["0.0.0.0/0"]
   
  }  
   ingress {
   description      = "apps1"
   from_port        = 31900
   to_port          = 31900
   protocol         = "tcp"
   cidr_blocks      = ["0.0.0.0/0"]
   
  }    
}
