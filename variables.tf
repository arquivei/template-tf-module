# ################################
# ###### GENERAL  VARIABLES ######
# ################################

variable "mandatory" {
  type        = string
  description = "this field is mandatory"
}

variable "optional" {
  default     = "default_value"
  description = "this field is optional"
}

variable "gcp_project_id" {
  description = "GCP project id that will be used"
  type        = string
}

variable "region" {
  type        = string
  description = "GCP region, e.g. southamerica-east1"
  default     = "us-east1"
}

variable "zones" {
  type        = list(string)
  description = "GCP zone, e.g. us-east1-b, us-east1-c (which must be in gcp_region)"
  default = [
    "us-east1-b",
    "us-east1-c",
    "us-east1-d",
  ]
}