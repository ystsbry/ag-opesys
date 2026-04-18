terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
    auth0 = {
      source  = "auth0/auth0"
      version = "~> 1.0"
    }
    neon = {
      source  = "kislerdm/neon"
      version = "~> 0.6"
    }
  }

  backend "s3" {
    bucket                      = "ag-opesys-tfstate"
    key                         = "prod/terraform.tfstate"
    region                      = "auto"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    use_path_style              = true
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

provider "auth0" {
  domain        = var.auth0_domain
  client_id     = var.auth0_client_id
  client_secret = var.auth0_client_secret
}

provider "neon" {
  api_key = var.neon_api_key
}

module "gcp" {
  source = "../../modules/gcp"

  gcp_project_id    = var.gcp_project_id
  gcp_region        = var.gcp_region
  project_name      = "${var.project_name}-prod"
  github_repository = var.github_repository
}

module "auth0" {
  source = "../../modules/auth0"

  project_name   = "${var.project_name}-prod"
  api_identifier = var.auth0_api_identifier
  callback_urls  = ["https://ag-opesys.example.com/callback"]
  logout_urls    = ["https://ag-opesys.example.com"]
  web_origins    = ["https://ag-opesys.example.com"]
}

module "neon" {
  source = "../../modules/neon"

  project_name = var.project_name
  environment  = "prod"
}
