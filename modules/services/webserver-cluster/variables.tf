variable "cluster_name" {
  description = "The name to use for all the cluster"
  type        = string
}

variable "db_remote_state_bucket" {
  description = "The name of the s3 bucket for database's remote state"
  type        = string
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state"
}

variable "region" {
  description = "The default region"
  type        = string
  default     = "ap-southeast-1"
}

variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "min_size" {
  description = "Minimum size of Auto-scaling group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum size of Auto-scaling group"
  type        = number
  default     =2
}

variable "server_port" {
  description = "The port of the instance"
  type        = number
  default     = 8080
}
