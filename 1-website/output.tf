output "bastion-instance-public_ip" {
  value = aws_instance.bastion-instance.public_ip
}

output "bastion-instance-private_ip" {
  value = aws_instance.bastion-instance.private_ip
}


output "private-instance-1_ip" {
  value = aws_instance.private-instance-1.private_ip
}

output "private-instance-2_ip" {
  value = aws_instance.private-instance-2.private_ip
}

output "web_loadbalancer_url" {
  value = aws_alb.demo-ALB.dns_name
}

