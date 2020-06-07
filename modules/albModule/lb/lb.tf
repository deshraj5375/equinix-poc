resource "aws_lb" "alb" {
  name               = "${var.albname}"
  internal           = "${var.internalLb}"
  load_balancer_type = "${var.albType}"
  security_groups    =  ["${var.sgid}"]
  subnets            = "${var.subnets}"
  enable_deletion_protection = false
  tags = {
    Name        = "Tibco-ALB"
    Environment = "Dev"
  }
}
output "lbARN" {
value="${aws_lb.alb.arn}"
}