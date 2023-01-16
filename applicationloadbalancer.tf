resource "aws_lb" "alpha-alb" {
  name                = "alpha-alb"
  internal            = false
  load_balancer_type  = "application"
  security_groups     = [aws_security_group.alpha-sg.id]
  subnets             = [aws_subnet.zonea-public-subnet.id,aws_subnet.zoneb-public-subnet.id]
}

resource "aws_lb_listener" "alpha-alb-listener" {
  #load_balancer_arn = aws_lb.terramino.arn
  load_balancer_arn = aws_lb.alpha-alb.arn
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alpha-alb-tg.arn
  }
}

resource "aws_lb_target_group" "alpha-alb-tg" {
  name        = "alpha-alb-tg"
  port        = "8080"
  protocol    = "HTTP"
  vpc_id      = aws_vpc.alpha-vpc-tf.id
}

resource "aws_autoscaling_attachment" "alpha-auto-scaling-group-attachment" {
 autoscaling_group_name = aws_autoscaling_group.alpha-auto-scaling-group.id
 alb_target_group_arn   = aws_lb_target_group.alpha-alb-tg.arn  
}