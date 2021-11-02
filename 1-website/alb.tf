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
    healthy_threshold   = "2"
    unhealthy_threshold = "2"
    interval            = "6"
    matcher             = "200,301,302"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
  }
}  

# create listener for http
resource "aws_alb_listener" "listener-http" {  
  load_balancer_arn = aws_alb.demo-ALB.id
  port              = "80"
  protocol          = "HTTP"

  default_action { 
    type = "redirect" 

    redirect { 
      port          = "443" 
      protocol      = "HTTPS" 
      path          = "/"
      status_code   = "HTTP_301" 
    } 
  }
}
# create listener for https 
resource "aws_alb_listener" "listener-https" {
  load_balancer_arn = aws_alb.demo-ALB.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate_validation.cert.certificate_arn
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.demo-TG.arn
  }
}
 
