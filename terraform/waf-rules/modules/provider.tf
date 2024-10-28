terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.0.0-alpha1"
    }
  }
  # backend "s3" {
    # bucket         = "bucket-name"
    # region         = "region"
    # dynamodb_table = "dynamodb-table-name"
    # profile        = "AWS profile name"
    # key            = "Name of the Terraform state file"
  # }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
