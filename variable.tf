variable "region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-west-1"
}

variable "instance_type" {
  description = "The type of EC2 instance to use."
  type        = string
  default     = "t2.micro"
}

variable "ports" {
  description = "List of ingress ports to allow."
  type        = list(number)
  default     = [22, 80, 443]
}

variable "vpc_cidr" {
  description = "List of IP addresses allowed to access the instance."
  type        = string
  default     = "10.0.0.0/16"
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access."
  type        = string
  default     = "tr"
}
