resource "aws_lb_target_group" "albtg" {
  name     = "${var.tgName}"
  port     = 80
  protocol = "HTTP" 
  vpc_id   = "${var.vpc}"
  health_check{
                enabled="${var.albHelathCheck}"
                interval="${var.albInterval}"
                path="${var.albPath}"
                port="${var.albPort}"
                protocol="${var.albProtocol}"
                timeout="${var.timeoutPeriod}"
                healthy_threshold ="${var.healthyCount}"
                unhealthy_threshold="${var.unhealthyCount}"
                matcher="${var.albResultCode}"
              }
}

output "tgARN" {
value="${aws_lb_target_group.albtg.arn}"
}
