
variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
}

variable "region" {
  description = "The region for the App Engine application"
  type        = string
  default     = "us-central"
}

variable "source_code_url" {
  description = "URL of the application source code archive in Google Cloud Storage"
  type        = string
}
