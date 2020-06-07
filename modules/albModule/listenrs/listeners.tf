resource "aws_lb_listener" "nlblistenr" {
  load_balancer_arn = "${var.lbArn}"
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = "${var.tgArn}"
  }
}