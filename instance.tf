resource "aws_key_pair" "avicontroller" {
  key_name_prefix = "${var.environment_name}-avicontroller-"
  public_key      = "${var.public_key}"
}

data "aws_ami" "avicontroller" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Avi-Controller-*"]
  }

  owners = ["679593333241"]
}

data "template_file" "setup" {
  template = "${file("${path.module}/files/setup-nocloud.json.tpl")}"

  vars {
    password = "${var.password}"
  }
}

resource "aws_instance" "avicontroller" {
  ami                    = "${data.aws_ami.avicontroller.id}"
  instance_type          = "${var.instance_type}"
  iam_instance_profile   = "${aws_iam_instance_profile.avicontroller.name}"
  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["${aws_security_group.avicontroller.id}"]
  key_name               = "${aws_key_pair.avicontroller.key_name}"
  user_data              = "${data.template_file.setup.rendered}"

  root_block_device {
    volume_type = "gp2"
  }

  tags {
    Name    = "${var.environment_name}-avicontroller"
    AviRole = "Controller"
  }
}
