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

