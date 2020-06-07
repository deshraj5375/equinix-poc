resource "aws_lb_target_group" "nlbtg" {
  name     = "${var.tgName}"
  port     = 80
  protocol = "TCP"
  vpc_id   = "${var.vpc}"
  stickiness {
    enabled = false
    type    = "lb_cookie"  
}
health_check {
enabled = "true"
interval="30"
port="traffic-port"
protocol="TCP"
healthy_threshold ="10"
unhealthy_threshold="10"
}
}

output "tgARN" {
value="${aws_lb_target_group.nlbtg.arn}"
}
