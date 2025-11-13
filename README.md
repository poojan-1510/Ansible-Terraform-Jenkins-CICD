# Terraform & Ansible Jenkins Deployment

This repository contains **Terraform and Ansible configurations** to provision infrastructure and deploy Jenkins , Nexus Repo , Sonarqube on Docker.

---

## Prerequisites

- Terraform installed ([Installation Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli))  
- Ansible installed ([Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html))  
- Access to a cloud provider (e.g., AWS)  
- SSH access to the provisioned instances  

---



## Terraform and ansible Workflow

For terraform: Navigate to the Terraform directory and run all commands:

For ansible : Navigate to the Ansible directory, update inventory ip with Terraform outputs ip , and run all playbooks:


```bash
cd terraform
terraform init
terraform validate
terraform fmt
terraform plan
terraform apply -auto-approve
terraform output


cd ../ansible

first change the ip addresses from terraform outputs to inventory acordingly

ansible-playbook provisions.yml





