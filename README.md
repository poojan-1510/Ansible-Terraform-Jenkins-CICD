Terraform & Ansible Jenkins Deployment
This repository contains Terraform and Ansible configurations to provision infrastructure and deploy Jenkins on Docker.
Prerequisites
Terraform installed (Installation Guide)
Ansible installed (Installation Guide)
Access to a cloud provider (e.g., AWS)
SSH access to the provisioned instances
Terraform Workflow
Navigate to the Terraform directory:
cd terraform
Initialize Terraform:
terraform init
Validate the configuration:
terraform validate
Format Terraform files (optional but recommended):
terraform fmt
Plan the infrastructure changes:
terraform plan
Apply the configuration:
terraform apply -auto-approve
Retrieve output values (e.g., instance IPs):
terraform output

Ansible Workflow
Navigate to the Ansible directory:
cd ../ansible
Update the inventory file with the public IP of the instance created by Terraform.
Run the Ansible playbooks in order:
ansible-playbook bootstrap.yml
ansible-playbook install-docker.yml
ansible-playbook jenkins-docker.yml
Notes
Ensure SSH keys are properly configured so Ansible can connect to the instance.
Jenkins will be accessible at the server’s public IP, default port 8080.
If you make changes to the Terraform configuration, rerun terraform apply to update resources.
