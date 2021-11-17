
############################
# General Purpouse variables
############################


variable "name" {
  description = "Name for the service we will deploy"
  type        = string
  default     = "fortressiq-qa-testing-new-animation-1"
}

variable "region_var" {
  description = "The category of the components"
  type        = string
  default     = "us-central1"
}

variable "project" {
  description = "name of project"
  type        = string
  default     = "fiq-trantor"
}

variable "image_name" {
  description = "name of container image"
  type        = string
  default     = "gcr.io/fiq-trantor/tina-react-python:latest"
}

variable "GCS_BUCKET_NAME" {
  type        = string
  description = "describe your variable"
  default     = "cloud-run-storage"
}
