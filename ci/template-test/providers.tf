# Terraform configuration

terraform {
  required_providers {
    solacebroker = {
      source = "registry.terraform.io/solaceproducts/solacebroker"
      version = "~> 0.9.1"
    }
  }
  required_version = "~> 1.2"
}