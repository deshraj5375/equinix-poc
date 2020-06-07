#!/bin/bash
sudo su - root
echo "output: {all: '| tee -a /var/log/cloud-init-output.log'}" >> /etc/cloud/cloud.cfg.d/05_logging.cfg
service cloud-init-local.service restart
yum install httpd -y
echo "This is created from Terraform" > /var/www/html/index.html                
service httpd start
yum update -y
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
service sshd restart
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNn/UR0jb/w7E6zdNdWTLk2sSg7a9fNPT0claRheYOABUzKLA0W0Gnh3vjDTesSsh8SYYGCIjp4L1brUUoUVgE//TZowz9F3wlUGtNiG36aXpu594PUvcbA5TB7cE1iR3WX1kncCEqioFX5AE6LQn0Zj29qdIDkwF1lwFGGKPCbXlMW90r1yC/2vPu/4SWO9KqiMBqSBKo28PBUEMnzq/67qkJ0b83Cryzi7d84q/+ytD94OKDO+Hbe56TNsETCHmpG2O5ZPq0kAX9QBqes9eVaBonXnKquSvnfDoLISn/ThXoBNSzbDewwSaie2yszisYylaChqcGv+j3ohCWTx0J" >>/home/tibco/.ssh/authorized_keys