#
# Provider Configuration
#

provider "aws" {
  region = var.region
}

# eu-west-2 Using these data sources allows the configuration to be
# generic for any region.
data "aws_region" "current" {}

data "aws_availability_zones" "available" {}

# Not required: currently used in conjuction with using
# icanhazip.com to determine local workstation external IP
# to open EC2 Security Group access to the Kubernetes cluster.
# See workstation-external-ip.tf for additional information.
provider "http" {}

# Target state
terraform {
  backend "s3" {
    bucket = "${var.client_name}-terraform-state"
    key    = "${var.environment}/${var.product}-${var.region}.tfstate"
    region = var.region
  }
}

#data "terraform_remote_state" "target" {
#  backend = "s3"

#  config = {
#    bucket  = "${var.client_name}-terraform-state"
#    key     = "${var.environment}/${var.prodcut_name}-${var.region}.tfstate"
#    region  = var.region
#    dynamodb_table = "${var.client_name}-terraform-locks"
#    encrypt = "true"
#    skip_metadata_api_check     = true
#    skip_region_validation      = true
#    skip_credentials_validation = "true"
#  }
#}