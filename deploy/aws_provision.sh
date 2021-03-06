#!/bin/bash
aws cloudformation create-stack --stack-name myteststack --template-body file://deploy/cf.template --parameters ParameterKey=KeyName,ParameterValue=djangoKey

while [ -z "${ec2_ip}" ]; do
  sleep 5;
  ec2_ip=$(aws cloudformation describe-stacks | grep "OutputValue" | awk -F '"' '{print $4}' | grep -v i)
done

scp -o StrictHostKeyChecking=no -i "djangoKey.pem" ./deploy/instance_provision.sh ubuntu@${ec2_ip}:/home/ubuntu
ssh -o StrictHostKeyChecking=no -i "djangoKey.pem" ubuntu@${ec2_ip} "chmod +x /home/ubuntu/instance_provision.sh; /home/ubuntu/instance_provision.sh"
scp -o StrictHostKeyChecking=no -i "djangoKey.pem" ./deploy/app_deploy.sh ubuntu@${ec2_ip}:/home/ubuntu
ssh -o StrictHostKeyChecking=no -i "djangoKey.pem" ubuntu@${ec2_ip} "chmod +x /home/ubuntu/app_deploy.sh;/home/ubuntu/app_deploy.sh"


#aws cloudformation delete-stack --stack-name "myteststack"
