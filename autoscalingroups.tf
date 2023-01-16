resource "aws_launch_configuration" "alpha-launch-configuration" {
  name_prefix     = "alpha-launch-configuration"
  image_id        = var.image_id
  instance_type   = "t2.micro"
  user_data       = file("user-data.sh")
  security_groups = [aws_security_group.alpha-sg.id]
  key_name = "us-east-2"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "alpha-auto-scaling-group" {
  name                 = "alpha-auto-scaling-group"
  min_size             = 1
  max_size             = 5
  desired_capacity     = 2
  launch_configuration = aws_launch_configuration.alpha-launch-configuration.name
  vpc_zone_identifier  = [aws_subnet.zonea-public-subnet.id,aws_subnet.zoneb-public-subnet.id]

  tag {
    key                 = "Name"
    value               = "alpha-asg-instances"
    propagate_at_launch = true
}
}
