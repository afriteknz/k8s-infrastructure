#### EKS Platform
- Contains terraform code to deploy EKS infrastructure on AWS.

Steps 

- Make sure you have configured AWS profile 
- install awscli 
- check the version #aws --version

type aws configure , your credentials file  - cat C:\Users\admin\.aws\credentials should look like this 

[sandbox]
region = ap-southeast-2
aws_access_key_id = XYZ
aws_secret_access_key = XYZ

Test ability to connect to AWS with the configured profile like this 

- #aws sts get-caller-identity --profile=XXX

run #export AWS_PROFILE=sandbox to connect to aws   # Bash Prompt

#### Automating Terraform With Github actions

Integrating AWS credentials with GitHub Actions using OpenID Connect.

4 steps my

- Create an OpenID Connect identity provider in IAM
- Create a new IAM role
- Edit the IAM role
- Store the IAM role details in Github Actions and refer to that in the YAML file.