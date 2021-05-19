
# *Main Providers and pre-requisites
data "google_client_config" "default" {}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.67"
    } # https://github.com/terraform-providers/terraform-provider-google-beta/releases
  }

  # # GCS Backend Exemple: State module_exemple
  # backend "gcs" {
  #   bucket = "tf_states-modules"
  #   path   = "modules/module-exemple.tfstate"
  # }

  # Local Backend Exemple: State module_exemple
  backend "local" {
    path = "./tfstate_local.tfstate"
  }

}

# Official Google Cloud Provider for Beta Resources & Features
provider "google-beta" {

  project = var.gcp_project_id
  region  = var.region

}
