# Simple DevOps Project
This project is for creating a simple CI/CD pipeline using the following tools and platforms: Terraform, Ansible, Amazon Web Services, Git, and Jenkins.

## Prerequisites
- Create AWS Account
- Create an SSH key
- Install Terraform

## Deploying to AWS using Terraform and Ansible
```bash
terraform init
terraform apply
ansible-playbook httpd.yml
```
The jump machine is for configuring a jump box for logging into the other machines. This can be done using the AWS console.

## Jenkins Installation
Jenkins can be hand installed on the jenkins machine and configured through its web portal. Make sure it is ready perform integration and deployment tasks.
TIP: Do not allow jenkins machine to be destroyed by Terraform.

## Jenkins Automated Pipeline
Jenkins deploys code automatically via the dev branch and head commits by running jobs for each branch. These jobs use SSH to publish the html content to the web servers on the dev and prod machines. Github webhooks are used to trigger the Jenkins jobs whenever new code is committed to a branch.




