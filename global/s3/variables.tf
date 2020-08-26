variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-southeast-1"
}
variable "bucket_name" {
  description = "The name of the bucket"
  type        = string
  default     = "von-tfstate"
}

variable "db_table" {
  description = "The name of the Dynamodb table"
  type        = string
  default     = "tfstate-lock"
}