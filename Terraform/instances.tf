resource "aws_instance" "TP_Terraform" {
  ami                    = "ami-06e2b3882a1e987b7"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet_tp_terraform.id
  key_name               = "AWS-SSH"
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  tags = {
    Name      = "terraform-test"
    Terraform = "True"
  }
}

resource "aws_instance" "TP_Terraform_Two" {
  ami                    = "ami-06e2b3882a1e987b7"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet_tp_terraform.id
  key_name               = "AWS-SSH"
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  tags = {
    Name      = "terraform-test-two"
    Terraform = "True"
  }
}

resource "aws_instance" "TP_Terraform_Three" {
  ami                    = var.ami_tp_terraform
  instance_type          = var.type_tp_terraform
  subnet_id              = aws_subnet.subnet_tp_terraform.id
  key_name               = var.key_tp_terraform
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  tags = {
    Name      = "terraform-test-two"
    Terraform = "True"
  }
}