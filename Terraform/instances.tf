resource "aws_instance" "Terraform_NGINX_One" {
  ami                    = var.ami_tp_terraform
  instance_type          = var.type_tp_terraform
  subnet_id              = aws_subnet.subnet_public.id
  key_name               = var.key_tp_terraform
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  tags = {
    Name      = "Terraform_NGINX_One"
    Terraform = "True"
  }
}

resource "aws_instance" "Terraform_NGINX_Two" {
  ami                    = var.ami_tp_terraform
  instance_type          = var.type_tp_terraform
  subnet_id              = aws_subnet.subnet_public.id
  key_name               = var.key_tp_terraform
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  tags = {
    Name      = "Terraform_NGINX_Two"
    Terraform = "True"
  }
}