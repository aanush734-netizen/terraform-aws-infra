output "instance_public_ip" {
    value = aws_instance.server.public_ip
    description = "Public IP address of the server"
}
output "instance_url" {
    value = "http://${aws_instance.server.public_ip}"
    description = "Public URL of the server"
}
