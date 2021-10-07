variable "ami_tp_terraform" {
  type    = string
  default = "ami-087c17d1fe0178315" #AMI oficial de Amazon Linux x86
}

variable "type_tp_terraform" {
  type    = string
  default = "t2.micro"
}

variable "region_tp_terraform" {
  type    = string
  default = "us-east-1"
}

variable "profile_tp_terraform" {
  type    = string
  default = "Terraform"
}

variable "key_tp_terraform" {
  type    = string
  default = "AWS-SSH"
}

#output "ip_public_tp_terraform" {
#  value = aws_instance.TP_Terraform_Three.public_ip
#}

#output "dns_public_tp_terraform" {
#  value = aws_instance.TP_Terraform_Three.public_dns
#}
