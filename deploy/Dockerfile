FROM python:3

RUN pip3 install ansible boto3
ADD ansible.cfg /etc/ansible/ansible.cfg
ADD hosts /etc/ansible/hosts
ADD aws_deploy.yml /deploy/aws_deploy.yml
