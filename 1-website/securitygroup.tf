# create Security Group for Instances
resource "aws_security_group" "instance-sg" {
  vpc_id      = aws_vpc.main.id
  name        = "instance-sg"
  description = "security group for my instance that allows ssh"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80 
    to_port     = 80 
    protocol    = "tcp" 
    cidr_blocks = ["0.0.0.0/0"] 
  } 

  ingress { 
    from_port   = 443 
    to_port     = 443 
    protocol    = "tcp" 
    cidr_blocks = ["0.0.0.0/0"]  
  } 
  tags = {
    Name = "instance-sg"
  }
}

# create Security Group for Application Load Balancer
resource "aws_security_group" "alb_security-group" {
  vpc_id      = aws_vpc.main.id 
  name        = "alb_security-group"
  description = "security group that allows http and https"
 ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "HTTP"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    description = "HTTPS"
    cidr_blocks = ["0.0.0.0/0"]
  }

 egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

 tags = {
    Name = "alb_security-group"
  }
}
