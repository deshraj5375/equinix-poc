variable "albname" {
	default = "TIB-ActiveService-US-ALB"
}
variable "internalLb" {
	default = "true"
}
variable "albType" {
	default = "application"
}
variable "subnets" {
	default     = ["subnet-0949a76f","subnet-98866cc7"]
}
variable "tgName" {
	default     = "TIB-ActiveService-US-ALB-TG"
}
variable "vpc" {
	default     = "vpc-aba993d1"
}
variable "sgGroupName" {
	default     = "TIB-ActiveService-US-ALB-EC2SG"
}
variable "albsgGroupName" {
	default     = "TIB-ActiveService-US-ALB-SG"
}
variable "amiValue" {
	default     = "ami-09d95fab7fff3776c"
}
variable "azName" {
  default = "us-east-1a"
}
variable "instanceType" {
	default     = "t2.micro"
}
variable "ebsSize" {
	default     = "01"
}
variable "keyname" {
	default     = "awsJenkins"
}
variable "albHelathCheck" {
	default     = "true"
}
variable "albInterval" {
	default     = "30"
}
variable "albPath" {
	default     = "/"
}
variable "albPort" {
	default     = "traffic-port"
}
variable "albProtocol" {
	default     = "HTTP"
}
variable "timeoutPeriod" {
	default     = "5"
}
variable "healthyCount" {
	default     = "3"
}
variable "unhealthyCount" {
	default     = "3"
}
variable "albResultCode" {
	default     = "200"
}
variable "asgName" {
	default     = "TIB-ActiveService-US-ALB-ASG"
}
variable "asgMin" {
	default     = "1"
}
 variable "asgMax" {
	default     = "1"
}
variable "asgDesiredcapacity" {
	default     = "1"
}
variable "asgHelthCheckGracePeriod" {
	default     = "300"
}
variable "asgHelathCheckType" {
	default     = "ELB"
}