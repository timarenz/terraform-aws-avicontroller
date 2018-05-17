resource "aws_iam_role" "avicontroller" {
  name_prefix        = "${var.environment_name}-avi-"
  assume_role_policy = "${file("${path.module}/files/avicontroller-role-trust.json")}"
}

resource "aws_iam_instance_profile" "avicontroller" {
  name_prefix = "${var.environment_name}-avi-"
  role        = "${aws_iam_role.avicontroller.name}"
}

resource "aws_iam_role_policy" "avicontroller_policy" {
  name_prefix = "${var.environment_name}-avi-policy"
  role        = "${aws_iam_role.avicontroller.id}"
  policy      = "${file("${path.module}/files/avicontroller-role-policy.json")}"
}

resource "aws_iam_role_policy" "avicontroller_r53" {
  name_prefix = "${var.environment_name}-avi-r53"
  role        = "${aws_iam_role.avicontroller.id}"
  policy      = "${file("${path.module}/files/avicontroller-role-r53-policy.json")}"
}

resource "aws_iam_role_policy" "avicontroller_autoscaling" {
  name   = "${var.environment_name}-avi-autoscaling"
  role   = "${aws_iam_role.avicontroller.id}"
  policy = "${file("${path.module}/files/avicontroller-role-auto-scaling-group-policy.json")}"
}

resource "aws_iam_role_policy" "avicontroller_asg_notification" {
  name   = "${var.environment_name}-avi-asg-notification"
  role   = "${aws_iam_role.avicontroller.id}"
  policy = "${file("${path.module}/files/avicontroller-asg-notification-policy.json")}"
}

resource "aws_iam_role_policy" "avicontroller_sqs" {
  name   = "${var.environment_name}-avi-sqs"
  role   = "${aws_iam_role.avicontroller.id}"
  policy = "${file("${path.module}/files/avicontroller-sqs-policy.json")}"
}

resource "aws_iam_role_policy" "avicontroller_sns" {
  name   = "${var.environment_name}-avi-sns"
  role   = "${aws_iam_role.avicontroller.id}"
  policy = "${file("${path.module}/files/avicontroller-sns-policy.json")}"
}

resource "aws_iam_role" "avicontroller_vmimport" {
  name_prefix        = "${var.environment_name}-avi-vmimport"
  assume_role_policy = "${file("${path.module}/files/vmimport-role-trust.json")}"
}

resource "aws_iam_role_policy" "avicontroller_vmimport" {
  name_prefix = "${var.environment_name}-avi-vmimport"
  role        = "${aws_iam_role.avicontroller_vmimport.id}"
  policy      = "${file("${path.module}/files/vmimport-role-policy.json")}"
}
