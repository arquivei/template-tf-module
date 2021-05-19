
# *Main Providers and pre-requisites
data "google_client_config" "default" {}

terraform {
  
  required_version = ">= 0.15.0"

  required_providers {

    google-beta = {
      version = "~> 3.50"
    } # https://github.com/terraform-providers/terraform-provider-google/releases

    google = {
      version = "~> 3.50"
    } # https://github.com/terraform-providers/terraform-provider-google-beta/releases

    null = {
      version = "~> 3.1"
    } # https://github.com/hashicorp/terraform-provider-null/releases
    
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

# Official Google Cloud Provider for GA Resources & Features
provider "google" {

  project = var.gcp_project_id
  region  = var.region

}

# Provider for Null Resources
provider "null" {

}

