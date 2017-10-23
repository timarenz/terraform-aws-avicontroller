resource "aws_key_pair" "avicontroller" {
  key_name_prefix = "${var.owner_name}-${var.environment_name}-avicontroller-"
  public_key      = "${file("${var.key_path}")}"
}

data "template_file" "setup" {
  template = "${file("${path.module}/files/setup-nocloud.json.tpl")}"

  vars {
    password = "${var.password}"
  }
}

resource "aws_instance" "avicontroller" {
  ami                     = "${var.ami_id}"
  instance_type           = "${var.instance_type}"
  iam_instance_profile    = "${aws_iam_instance_profile.avicontroller.name}"
  subnet_id               = "${var.subnet_id}"
  vpc_security_group_ids  = ["${aws_security_group.avicontroller.id}"]
  key_name                = "${aws_key_pair.avicontroller.key_name}"
  user_data               = "${data.template_file.setup.rendered}"         

  tags {
        Name    = "${var.owner_name}-${var.environment_name}-avicontroller"
        AviRole = "Controller"
  }
}