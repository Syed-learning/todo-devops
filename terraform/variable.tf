variable "aws_region" {
  description = "AWS region to launch the instance in"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for Ubuntu 22.04"
  default     = "ami-020cba7c55df1f615" # Update if needed
}

variable "key_name" {
  description = "Name of the existing EC2 Key Pair"
  type        = string
  default     = "flask-docker-key"
}

variable "project_name" {
  description = "Name tag for the project"
  default     = "ToDoAppServer"
}
