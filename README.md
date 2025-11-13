# Terraform & Ansible Jenkins Deployment

DevOps CI/CD Infrastructure — Terraform + Ansible + Docker
Overview
This project provisions and configures a complete CI/CD environment on AWS using Terraform and Ansible.
The infrastructure is built with Terraform (Infrastructure as Code) and consists of 4 EC2 instances within a single VPC:
Public Subnet:
Bastion Host – used as a secure jump host for SSH access to private instances.
Jenkins Server – runs Jenkins in a Docker container.
Private Subnet:
Nexus Repository – hosts artifacts using Nexus in a Docker container.
SonarQube Server – runs code quality analysis with SonarQube in a Docker container.
Ansible is used to configure all servers automatically after provisioning, including:
Installing Docker.
Running Jenkins, Nexus, and SonarQube as containers.
Setting up SSH access and secure connectivity through the Bastion host.
Configuring Jenkins with GitHub SSH keys and showing the initial admin password.
🏗️ Architecture Diagram
                     ┌────────────────────────────────┐
                     │            AWS VPC              │
                     │                                │
   Public Subnet ────┼───────────────────────────────┼──────────────
                     │   Bastion Host (EC2)          │
                     │     ↳ Public IP: <bastion_ip> │
                     │                                │
                     │   Jenkins Server (EC2)         │
                     │     ↳ Public IP: <jenkins_ip>  │
                     │     ↳ Docker: Jenkins LTS      │
                     │                                │
   Private Subnet ───┼───────────────────────────────┼──────────────
                     │   Nexus Repo (EC2)             │
                     │     ↳ Private IP: <nexus_ip>   │
                     │     ↳ Docker: Sonatype Nexus   │
                     │                                │
                     │   SonarQube Server (EC2)       │
                     │     ↳ Private IP: <sonarqube_ip> │
                     │     ↳ Docker: SonarQube CE     │
                     └────────────────────────────────┘

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





