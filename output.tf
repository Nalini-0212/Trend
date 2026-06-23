output "public_ip" {
  description = "The public IP address of the Jenkins_instance."
  value = aws_instance.jenkins_instance.public_ip
}
