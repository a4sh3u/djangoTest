FROM python:2

RUN pip install ansible boto3
ADD ansible.cfg /etc/ansible/ansible.cfg
ADD hosts /etc/ansible/hosts
ADD aws_deploy.yml /deploy/aws_deploy.yml
