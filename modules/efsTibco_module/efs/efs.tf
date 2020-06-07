resource "aws_efs_file_system" "efsTest" {
  creation_token = "${var.token}"
  tags = {
    Name = "${var.token}"
  }
}
output "efs_ID" {
  value = aws_efs_file_system.efsTest.id
}
output "efs_dnsname" {
  value = aws_efs_file_system.efsTest.dns_name
}