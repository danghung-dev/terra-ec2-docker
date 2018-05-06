output "public_id" {
  value = "${aws_instance.docker.public_ip}"
}
