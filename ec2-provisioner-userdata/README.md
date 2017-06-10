# Terraform project to create an EC2 and install docker on it
 -You need to have one public and private key file in the same path mentioned in variables.tf.This is used by provisioner to copy and execute the userdata.sh
 -I am using terraform.tfvars to use my aws credentials.If you dont have them then terraform apply will prompt you to provide aws_access_key and aws_secret_key.
 -This terraform creates an EC2.Copies the userdata.sh into /var/tmp folder and then runs userdata.sh

