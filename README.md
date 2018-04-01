# Building and Deploying sample django App


App is taken from the following link
https://docs.djangoproject.com/en/2.0/intro/tutorial01/

## Pre-requisites
- Modify aws_variables.sh and fill it with correct aws credentials
- Create a key named djangoKey from AWS and keep it in the main working directory of the Jenkins job
## Building the project
- Assuming you have Jenkins server already running, create a job with pipeline script and map it to the Jenlkinsfile in the build directory.
- Using docker-compose & docker, the app is being built
## Deployment
- AWS cloudformation script is being used to provision a EC2 instance and associated security group.
- And a few bash scripts then do the application deployment
