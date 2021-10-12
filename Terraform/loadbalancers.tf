module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "TP_Terraform_ALB"

  load_balancer_type = "application"

  vpc_id          = aws_vpc.vpc_tp_terraform.id
  subnets         = [aws_subnet.subnet_public.id]
  security_groups = [aws_security_group.allow_ssh_http.id]

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = [
        {
          target_id = aws_instance.Terraform_NGINX_One.id
          port      = 80
        },
        {
          target_id = aws_instance.Terraform_NGINX_Two.id
          port      = 8080
        }
      ]
    }
  ]


  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Name      = "Terraform_ALB"
    Terraform = "True"
  }
}