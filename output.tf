output public_ip {
  value = "${aws_instance.avicontroller.public_ip}"
}

output public_dns {
  value = "${aws_instance.avicontroller.public_dns}"
}

output private_ip {
  value = "${aws_instance.avicontroller.private_ip}"
}