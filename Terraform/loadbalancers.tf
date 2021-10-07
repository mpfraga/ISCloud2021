resource "aws_lb" "TP_Terraform_LB" {
  name               = "terraform-loadbalancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http_https.id]
  subnets            = [aws_subnet.subnet_public.id]
  ip_address_type = "ipv4"

  enable_deletion_protection = true

  tags = {
    Name = "TP-Terraform-Load-Balancer"
    Terraform   = "True"
    Description = "Load Balancer for the Lab"
  }
}

resource "aws_lb_target_group" "TP_Terraform_LB_TG" {
  name     = "terraform-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc_tp_terraform.id
  target_type = "instance"
}

resource "aws_lb_target_group_attachment" "TP_Terraform_LB_TG_One" {
  target_group_arn = aws_lb_target_group.TP_Terraform_LB_TG.arn
  target_id        = aws_instance.Terraform_NGINX_One.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "TP_Terraform_LB_TG_Two" {
  target_group_arn = aws_lb_target_group.TP_Terraform_LB_TG.arn
  target_id        = aws_instance.Terraform_NGINX_Two.id
  port             = 80
}