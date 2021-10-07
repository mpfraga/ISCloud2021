resource "aws_db_instance" "TP_Terraform_RDS"{
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "Wordpress"
  username             = "terraform"
  password             = "A12345678."
  skip_final_snapshot  = true
}