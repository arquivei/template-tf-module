variable "name" {
  type        = string
  description = "Name of subnet."
}

variable "project" {
  type        = string
  description = "Network project name"
}

variable "description" {
  type        = string
  description = "Description usage of subnet"
  default     = ""
}

variable "ip_cidr_range" {
  type        = string
  description = "IP range in CIDR format of the subnet"
}

variable "network" {
  type        = string
  description = "Name of self-link to the VPC this subnet will be linked to. Defaults to 'default' network"
}

variable "region" {
  type        = string
  description = "Region in which subnet will be created. Defaults to the region in the terraform provider"
  default     = ""
}

variable "create_secondary_ranges" {
  default     = false
  description = "Enable secondary ip ranges to be used with 'secondary_ranges' variable"
}

variable "secondary_ranges" {
  type        = list(any)
  default     = []
  description = "Create up to 5 alternative CIDR range to represent this subnetwork"
}

/******************************************
  Define local variables for use in outputs
 *****************************************/

locals {

  subnetwork_type = var.create_secondary_ranges ? "secondary_range" : "normal"

  name_output = {
    secondary_range = element(concat(google_compute_subnetwork.ranged.*.name, [""]), 0)
    normal          = element(concat(google_compute_subnetwork.basic.*.name, [""]), 0)
  }

  gateway_address_output = {
    secondary_range = element(
      concat(google_compute_subnetwork.ranged.*.gateway_address, [""]),
      0,
    )
    normal = element(
      concat(google_compute_subnetwork.basic.*.gateway_address, [""]),
      0,
    )
  }

  self_link_output = {
    secondary_range = element(
      concat(google_compute_subnetwork.ranged.*.self_link, [""]), 0,
    )
    normal = element(concat(google_compute_subnetwork.basic.*.self_link, [""]), 0)
  }

  ip_cidr_range_output = {
    secondary_range = element(
      concat(google_compute_subnetwork.ranged.*.ip_cidr_range, [""]), 0,
    )
    normal = element(
      concat(google_compute_subnetwork.basic.*.ip_cidr_range, [""]), 0,
    )
  }

  name            = local.name_output[local.subnetwork_type]
  description     = "${var.name} subnetwork"
  gateway_address = local.gateway_address_output[local.subnetwork_type]
  self_link       = local.self_link_output[local.subnetwork_type]
  ip_cidr_range   = local.ip_cidr_range_output[local.subnetwork_type]
  secondary_range = var.secondary_ranges
}

