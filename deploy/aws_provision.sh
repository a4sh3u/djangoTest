aws cloudformation create-stack --stack-name myteststack --template-body file:///root/djangoTest/deploy/cf.template --parameters ParameterKey=KeyName,ParameterValue=djangoKey

ec2_ip=$(aws cloudformation describe-stacks | grep "OutputValue" | awk -F '"' '{print $4}' | grep -v i)
scp -o StrictHostKeyChecking=no -i "djangoKey.pem" ./deploy/instance_provision.sh ubuntu@${ec2_ip}:/home/ubuntu
ssh -o StrictHostKeyChecking=no -i "djangoKey.pem" ubuntu@${ec2_ip} "/home/ubuntu/instance_provision.sh"
scp -o StrictHostKeyChecking=no -i "djangoKey.pem" ./deploy/app_deploy.sh ubuntu@${ec2_ip}:/home/ubuntu
ssh -o StrictHostKeyChecking=no -i "djangoKey.pem" ubuntu@${ec2_ip} "/home/ubuntu/app_deploy.sh"
