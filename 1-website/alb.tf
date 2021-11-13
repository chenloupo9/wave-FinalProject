# create Application Load Balancer
resource "aws_alb" "demo-ALB" { 
  name               = "demo-ALB" 
  internal           = false 
  load_balancer_type = "application" 
  security_groups    = [aws_security_group.alb_security-group.id] 
  subnets            = [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id]   


  tags = { 
    Name = "demo-ALB" 
  } 
}
# create target group for private-instance-1
resource "aws_alb_target_group" "demo-TG" {
  name        = "demo-TG"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.main.id

  health_check { 
    healthy_threshold   = 2
    unhealthy_threshold = 10
    interval            = 10
    path                = "/"
    port                = 80
    protocol            = "HTTP"
  }
  tags = { 
    Name = "demo-TG" 
  }
}


# create listener for http
resource "aws_alb_listener" "listener-http" {  
  load_balancer_arn = aws_alb.demo-ALB.id
  port              = "80"
  protocol          = "HTTP"

  default_action { 
    target_group_arn = aws_alb_target_group.demo-TG.arn 
    type             = "forward"
    } 
  }

# create attachment to target group for private-instance-1
resource "aws_alb_target_group_attachment" "TG-private-1" { 
  target_group_arn      = aws_alb_target_group.demo-TG.arn 
  target_id             = aws_instance.private-instance-1.id
  port                  = 80
}

# create attachment to target group for private-instance-2
resource "aws_alb_target_group_attachment" "TG-private-2" {
  target_group_arn      = aws_alb_target_group.demo-TG.arn
  target_id             = aws_instance.private-instance-2.id
  port                  = 80
}

