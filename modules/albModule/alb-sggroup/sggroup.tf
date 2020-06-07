resource "aws_security_group" "sgtest" {
  name        = "${var.albsgGroupName}"
  description = "Allow inbound traffic"
  vpc_id      = "${var.vpc}"
  ingress {
    description = "Port80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Tibco-ALB-SgGroup"
  }
}
output "sgID" {
value="${aws_security_group.sgtest.id}"
}

