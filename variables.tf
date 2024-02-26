variable "db_name" {
  type = string
}

variable "allocated_storage" {
  type = number
}

variable "max_allocated_storage" {
  type = number
}

variable "publicly_accessible" {
  type = bool
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "multi_az" {
  type = bool
}

variable "username" {
  type = string
}

variable "backup_retention_period" {
  type = number
}

variable "copy_tags_to_snapshot" {
  type = bool
}

variable "deletion_protection" {
  type = bool
}

variable "skip_final_snapshot" {
  type = bool
}

variable "storage_encrypted" {
  type = bool
}

variable "storage_type" {
  type = string
}

variable "iops" {
  type = number
}

variable "monitoring_interval" {
  type = number
}

variable "tags" {
  type = map(string)
  default = {
    ManagedBy = "Terraform"
  }
}

variable "aditional_tags" {
  type = map(string)
}

variable "instance_identifier" {
  type = string
}