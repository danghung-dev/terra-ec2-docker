provider "aws" {
  region = "${var.aws_region}"
}

locals {
  initscript = "${data.template_file.user_data.rendered}"
}

data "template_file" "user_data" {
  template = "${file("init.sh")}"
}

resource "aws_instance" "docker" {
  ami                         = "${lookup(var.amis, var.aws_region)}"
  availability_zone           = "${var.availability_zone}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.aws_key_name}"
  vpc_security_group_ids      = ["${var.vpc_security_group_ids}"]
  subnet_id                   = "${var.subnet_id}"
  associate_public_ip_address = true
  source_dest_check           = false
  user_data                   = "${data.template_file.user_data.rendered}"

  # provisioner "file" {
  #   source      = "initiallize.sh"
  #   destination = "/tmp/configure.sh"


  #   connection {
  #     type        = "ssh"
  #     user        = "ubuntu"
  #     private_key = "${file("${var.aws_key_path}")}"
  #   }
  # }


  # provisioner "file" {
  #   source      = "initiallize.sh"
  #   destination = "/tmp/configure.sh"
  # }


  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo useradd hung",
  #     "sudo usermod -aG sudo hung",
  #     "sudo usermod -aG docker hung",
  #   ]
  # }

  tags {
    Name = "remove soon test only"
  }
}
