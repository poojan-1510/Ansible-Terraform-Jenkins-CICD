output "bastion_public_ip" {
  value = aws_instance.bastion_server.public_ip
}
output "jenkins_public_ip" {
  value = aws_instance.jenkins_server.public_ip
}
output "nexus_private_ip" {
  value = aws_instance.nexus_server.private_ip
}
output "sonarqube_server_ip" {
  value = aws_instance.sonarqube_server.private_ip
}
output "ECR_REPO" {
  description = "ECR repository URL for the app"
  value       = "523026302352.dkr.ecr.us-east-2.amazonaws.com/project1-app"
}

output "CLUSTER_NAME" {
  description = "ECS cluster name"
  value       = aws_ecs_cluster.main.name
}

output "SERVICE_NAME" {
  description = "ECS service name"
  value       = aws_ecs_service.app_service.name
}