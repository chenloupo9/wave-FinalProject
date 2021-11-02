# create EC2 Instance on public subnet1
resource "aws_instance" "bastion-instance" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  subnet_id = aws_subnet.main-public-1.id
  vpc_security_group_ids = [aws_security_group.instance-sg.id]
  key_name = aws_key_pair.aws_key.key_name
  provisioner "file" { 
    source      = "aws_key" 
    destination = "/home/ubuntu/.ssh/aws_key" 
  }
    connection { 
      type        = "ssh" 
      user        = "ubuntu" 
      host        = self.public_ip
      private_key = file("/home/ubuntu/wave-FinalProject/1-website/aws_key")
    }
  user_data = "${file("install_docker.sh")}"
  tags = {
    Name = "bastion-instance"
  }
}

# create EC2 Instance on private subnet1
resource "aws_instance" "private-instance-1" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  subnet_id = aws_subnet.main-private-1.id
  vpc_security_group_ids = [aws_security_group.instance-sg.id]
  key_name = aws_key_pair.aws_key.key_name 
  user_data = "${file("install_docker.sh")}"
  tags = {
    Name = "private-instance-1"
  }
}

# create EC2 Instance on private subnet2
resource "aws_instance" "private-instance-2" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  subnet_id = aws_subnet.main-private-2.id
  vpc_security_group_ids = [aws_security_group.instance-sg.id]
  key_name = aws_key_pair.aws_key.key_name
  user_data = "${file("install_docker.sh")}"
  tags = {
    Name = "private-instance-2"
  }
}

# copy public SSH key
resource "aws_key_pair" "aws_key" {
  key_name   = "aws_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}


