/******************************************
  Create subnetwork without secondary_range
 *****************************************/

resource "google_compute_subnetwork" "basic" {
  count = var.create_secondary_ranges ? 0 : 1

  name                     = var.name
  description              = var.description != "" ? var.description : local.description
  region                   = var.region
  ip_cidr_range            = var.ip_cidr_range
  network                  = var.network
  project                  = var.project
  private_ip_google_access = true
}

/******************************************
  Create subnetwork with secondary_range
 *****************************************/

resource "google_compute_subnetwork" "ranged" {
  count = var.create_secondary_ranges ? 1 : 0

  name          = var.name
  description   = var.description != "" ? var.description : local.description
  region        = var.region
  ip_cidr_range = var.ip_cidr_range
  network       = var.network

  dynamic "secondary_ip_range" {
    for_each = var.secondary_ranges
    content {
      ip_cidr_range = lookup(secondary_ip_range.value, "ip_cidr_range", null)
      range_name    = lookup(secondary_ip_range.value, "range_name", null)
    }
  }

  project                  = var.project
  private_ip_google_access = true
}