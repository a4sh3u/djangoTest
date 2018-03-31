aws cloudformation create-stack --stack-name myteststack --template-body file:///root/djangoTest/deploy/cf.template --parameters ParameterKey=KeyName,ParameterValue=djangoKey

ec2_ip=$(aws cloudformation describe-stacks | grep "OutputValue" | awk -F '"' '{print $4}' | grep -v i)
ssh -o StrictHostKeyChecking=no 
