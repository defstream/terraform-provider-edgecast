# Copyright 2021 Edgecast Inc., Licensed under the terms of the Apache 2.0 license.
# See LICENSE file in project root for terms.

terraform {
  required_providers {
    ec = {
      version = "0.4.8"
      source  = "EdgeCast/ec"
    }
  }
}

##########################################
# Variables
##########################################

variable credentials {
  type = object ({
    api_token = string
    ids_client_secret = string
    ids_client_id = string
    ids_scope = string
    api_address = string
    ids_address = string
  })
}

##########################################
# Providers
##########################################

provider "ec" {
    api_token = var.credentials.api_token
    ids_client_secret = var.credentials.ids_client_secret
    ids_client_id = var.credentials.ids_client_id
    ids_scope = var.credentials.ids_scope
    ids_address = var.credentials.ids_address
    api_address = var.credentials.api_address
}



