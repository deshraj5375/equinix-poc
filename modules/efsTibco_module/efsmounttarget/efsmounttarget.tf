resource "aws_efs_mount_target" "efsMountTarget" {
  file_system_id  = "${var.efsid}"
  subnet_id       = "${var.subnets}"
  security_groups = ["${var.sgid}"]
}

resource "aws_efs_mount_target" "efsMountTarget1" {
  file_system_id  = "${var.efsid}"
  subnet_id       = "${var.subnet1}"
  security_groups = ["${var.sgid}"]
}
