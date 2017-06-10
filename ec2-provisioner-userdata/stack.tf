resource "aws_key_pair" "NodeServerEc2-key"{
	key_name = "mykey"
	public_key="${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "myterraforminstance"{
	ami = "ami-314b1727"
	instance_type = "t2.micro"
	tags {
    "Name" = "my-terraform-docker-ec2"
  	}
	"vpc_security_group_ids" = ["sg-4399d63d"]
	provisioner "file"{
		source = "userdata.sh"
		destination = "/var/tmp/userdata.sh"
		
	}
	provisioner "remote-exec"{
		inline = [
			"chmod +x /var/tmp/userdata.sh",
			"sudo /var/tmp/userdata.sh"
		]
	}
	connection{
			user = "ec2-user"
			private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
	}
}
