resource "aws_launch_configuration" "demo-launchconfig" {
  name_prefix                   = "demo-launchconfig"
  image_id                     = var.AMIS[var.AWS_REGION]
  instance_type                = var.instance_type 
  spot_price                   = var.spotprice
  key_name                     = aws_key_pair.aws_key.key_name
  security_groups	       = [aws_security_group.instance-sg.id]
  associate_public_ip_address = false

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "demo-ASG" {
  name                      = "demo-ASG"
  vpc_zone_identifier       = [aws_subnet.main-private-1.id, aws_subnet.main-private-2.id]
  launch_configuration      = aws_launch_configuration.demo-launchconfig.name
  min_size                  = 2
  max_size                  = 2
  desired_capacity          = 2
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "web-demo-ASG"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "ASG-attach" {
  autoscaling_group_name = aws_autoscaling_group.demo-ASG.id
  alb_target_group_arn   = aws_alb_target_group.demo-TG.arn
}
