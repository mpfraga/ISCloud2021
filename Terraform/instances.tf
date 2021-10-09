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


resource "aws_instance" "Terraform_Wordpress" {
  ami                    = var.ami_tp_terraform
  instance_type          = var.type_tp_terraform
  subnet_id              = aws_subnet.subnet_internal.id
  key_name               = var.key_tp_terraform
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  tags = {
    Name      = "Terraform_Wordpress"
    Terraform = "True"
  }
  user_data = "${file("install_LAMP_Stack.sh")}"
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("/usr/AWS-SSH.pem")
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install php-gd",
      "sudo service httpd restart",
      "cd ~",
      "wget http://wordpress.org/latest.tar.gz",
      "tar xzvf latest.tar.gz",
      "sudo rsync -avP ~/wordpress/ /var/www/html/",
      "mkdir /var/www/html/wp-content/uploads",
      "sudo chown -R apache:apache /var/www/html/*",
      "cd /var/www/html",
      "cp wp-config-sample.php wp-config.php",
      "sed 's/database_name_here/Wordpress/g' wp-config.php", #reemplaza 'database_name_here' con Wordpress
      "sed 's/username_here/terraform/g' wp-config.php",
      "sed 's/password_here/A12345678./g' wp-config.php",
    ]
    
  }
  




}