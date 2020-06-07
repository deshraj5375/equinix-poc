module "albsgGroup" {
 source               ="../../modules/albModule/alb-sggroup"   
  albsgGroupName        = "${var.albsgGroupName}"  
  vpc                = "${var.vpc}"
 }
module "albFirst" {
 source        ="../../modules/albModule/lb"   
   albname     = "${var.albname}"
   internalLb  = "${var.internalLb}"
   albType     = "${var.albType}"
   subnets     = "${var.subnets}"
   sgid        = "${module.albsgGroup.sgID}"
 }
module "albTargetGroup1" {
source        ="../../modules/albModule/targetGroup" 
  tgName   = "${var.tgName}"
  vpc   = "${var.vpc}"
  albHelathCheck="${var.albHelathCheck}"
  albInterval="${var.albInterval}"
  albPath="${var.albPath}"
  albPort="${var.albPort}"
  albProtocol="${var.albProtocol}"
  timeoutPeriod="${var.timeoutPeriod}"
  healthyCount ="${var.healthyCount}"
  unhealthyCount="${var.unhealthyCount}"
  albResultCode="${var.albResultCode}"
 }

module "albListener1" {
source  ="../../modules/albModule/listenrs" 
  lbArn = "${module.albFirst.lbARN}"
  tgArn = "${module.albTargetGroup1.tgARN}"
 }

 module "sggroup1" {
 source  ="../../modules/albModule/ec2sggroup"   
  sgGroupName        = "${var.sgGroupName}"  
  vpc                = "${var.vpc}"
 }
data "template_file" "script" {
  template = "${file("userdata.tpl")}"
}
module "launchTemplate" {
source  ="../../modules/albModule/launchTemplate"  
 secuirtyGroupId     = "${module.sggroup1.sgID}"
 amiValue            = "${var.amiValue}"
 instanceType        = "${var.instanceType}"
 ebsSize             = "${var.ebsSize}"
 userdata            = "${data.template_file.script.rendered}"
// keyname             = "${var.keyname}"
}
module "AsgGroup" {
source  ="../../modules/albModule/asg" 
  asgName                   = "${var.asgName}"
  lcName                    = "${module.launchTemplate.launchName}"
  subnets                   = "${var.subnets}"
  asgMin                    = "${var.asgMin}"
  asgMax                    = "${var.asgMax}"
  asgDesiredcapacity        = "${var.asgDesiredcapacity}"
  asgHelthCheckGracePeriod  = "${var.asgHelthCheckGracePeriod}"
  asgHelathCheckType        = "${var.asgHelathCheckType}"
  tgArn                     = ["${module.albTargetGroup1.tgARN}"]
}

terraform {
  backend "s3" {
    bucket                  = "bucketlifecycle"
    key                     = "terraform/us-east-1/alb.tfstate"
    region                  = "us-east-1"
    shared_credentials_file = "/home/ec2-user/aws-detail"
    profile                 = "DeshrajAdmin"
  }
}