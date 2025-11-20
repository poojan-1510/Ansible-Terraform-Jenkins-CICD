Terraform & Ansible CI/CD Infrastructure
Overview
This project provisions a fully automated CI/CD Infrastructure on AWS using:
Terraform — Infrastructure as Code
Ansible — Server configuration and automation
Docker — Containerized services
Bastion Host — Secure access to private servers
The setup deploys four EC2 instances inside a new VPC:
Component	Subnet	Description
Bastion Host	Public	Jump server for secure SSH access
Jenkins Server	Public	CI/CD pipeline engine in Docker
Nexus Repository	Private	Artifact repository in Docker
SonarQube Server	Private	Code quality analysis in Docker
This provides a reproducible CI/CD foundation with best-practice AWS networking.
Architecture Diagram
                     ┌──────────────────────────┐
                     │        Internet           │
                     └───────────┬──────────────┘
                                 │
                        Public Subnet
                                 │
                ┌────────────────┴─────────────────┐
                │                                    │
        ┌──────────────┐                     ┌──────────────┐
        │ Bastion Host │<────SSH────────────>│ Jenkins EC2  │
        └──────────────┘                     └──────────────┘
                │
     SSH Tunnel │
                ▼
      Private Subnet (isolated)
   ┌──────────────┐        ┌───────────────┐
   │ Nexus EC2    │        │ SonarQube EC2 │
   └──────────────┘        └───────────────┘
Prerequisites
Ensure the following tools are installed locally:
Required Tools
Terraform
Ansible
AWS CLI
SSH client
Mandatory Step for Every Terminal Session
To enable SSH access:
eval "$(ssh-agent -s)"
ssh-add path_to_your_key.pem
1. Terraform Workflow
Navigate to the Terraform directory
cd terraform
Initialize Terraform
terraform init
Validate Terraform code
terraform validate
Format all Terraform files
terraform fmt
Review execution plan
terraform plan
Deploy the infrastructure
terraform apply -auto-approve
Retrieve Infrastructure Outputs
This will display:
Bastion public IP
Jenkins public IP
Nexus private IP
SonarQube private IP
terraform output
You will use these values in the Ansible inventory.
2. Ansible Workflow
Navigate to Ansible directory
cd ../ansible
Update the inventory file
Replace placeholder IPs with Terraform outputs:
[bastion]
<BASTION_PUBLIC_IP>

[jenkins]
<JENKINS_PUBLIC_IP>

[nexus]
<NEXUS_PRIVATE_IP>

[sonarqube]
<SONARQUBE_PRIVATE_IP>
Run Ansible provisioning
ansible-playbook provisions.yml
Ansible will:
Install Docker & Docker Compose
Run Jenkins, Nexus, SonarQube containers
Configure system users & package dependencies
Enable SSH connectivity through Bastion
Output Jenkins initial admin password
3. Accessing Services
Jenkins (Public)
http://<JENKINS_PUBLIC_IP>:8080
Retrieve initial admin password:
sudo cat /var/jenkins_home/secrets/initialAdminPassword
Accessing Private Services (Nexus & SonarQube)
These require SSH tunneling through the Bastion host.
Connect to Nexus
ssh -L 8081:<NEXUS_PRIVATE_IP>:8081 ec2-user@<BASTION_PUBLIC_IP>
Then open:
http://localhost:8081
Connect to SonarQube
ssh -L 9000:<SONARQUBE_PRIVATE_IP>:9000 ec2-user@<BASTION_PUBLIC_IP>
Visit:
http://localhost:9000
4. Directory Structure
project/
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── vpc.tf
│   ├── ec2.tf
│   └── security-groups.tf
│
└── ansible/
    ├── inventory
    ├── provisions.yml
    ├── roles/
    │   ├── docker/
    │   ├── jenkins/
    │   ├── nexus/
    │   └── sonarqube/
    └── templates/
5. Workflow Summary
1️⃣ Configure AWS credentials
aws configure
2️⃣ Deploy AWS infrastructure
cd terraform
terraform init
terraform apply -auto-approve
terraform output
3️⃣ Run Ansible configuration
cd ../ansible
ansible-playbook provisions.yml
4️⃣ Access services (public + tunnelled private)
6. What This Deployment Provides
✔ Secure multi-tier AWS architecture
✔ Bastion host for safe private access
✔ Jenkins CI/CD server with Docker
✔ Nexus artifact repository
✔ SonarQube quality analysis
✔ Fully automated provisioning
✔ Infrastructure-as-Code + Configuration-as-Code
✔ Consistent, repeatable DevOps environment
7. Future Enhancements (Optional)
You can extend this project with:
ECS + Fargate deployment pipelines
ECR image repository integration
ALB for public services
Monitoring via CloudWatch + Grafana
Terraform remote backend (S3 + DynamoDB)