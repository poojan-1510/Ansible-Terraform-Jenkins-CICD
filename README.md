# Terraform & Ansible Jenkins Deployment

This repository contains **Terraform and Ansible configurations** to provision infrastructure and deploy Jenkins on Docker.

---

## Prerequisites

- Terraform installed ([Installation Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli))  
- Ansible installed ([Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html))  
- Access to a cloud provider (e.g., AWS)  
- SSH access to the provisioned instances  

---

## Terraform Workflow

Navigate to the Terraform directory and run all commands:

```bash
cd terraform
terraform init
terraform validate
terraform fmt
terraform plan
terraform apply -auto-approve
terraform output
terraform output -json > terraform_outputs.json

---

## Ansible Workflow

Navigate to the Ansible directory, update inventory with Terraform outputs, and run all playbooks:

```bash
cd ../ansible
ansible-playbook bootstrap.yml
ansible-playbook install-docker.yml
ansible-playbook jenkins-docker.yml

