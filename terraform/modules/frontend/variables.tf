variable "frontend_bucket_name" {
  type = string
  description = "Name of frontend bucket"
}

variable "bucket_object_ownership" {
  type = string
  description = "Ownership of all objects uploaded to this bucket"
}