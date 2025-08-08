output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.todo_app.public_ip
}

output "web_url" {
  description = "Access URL for the ToDo Flask App"
  value       = "http://${aws_instance.todo_app.public_ip}:5000"
}
