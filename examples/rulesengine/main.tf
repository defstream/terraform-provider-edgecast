# Copyright Verizon Media, Licensed under the terms of the Apache 2.0 license . See LICENSE file in project root for terms.

terraform {
  required_providers {
    vmp = {
      version = "0.0.8"
      source = "VerizonDigital/vmp"
    }
  }
}

##########################################
# Variables
##########################################

variable "credentials" {
  type = object ({
    api_token = string
    ids_client_secret = string
    ids_client_id = string
    ids_scope = string
  })
}

variable "rulesEngineEnvironment" {
  type = string
}

variable "test_customer_info" {
  type = object({
    account_number = string
    customeruserid = string
    portaltypeid = string
  })
  default = {
    account_number = ""
    customeruserid = ""
    portaltypeid = "1"
  }
}

##########################################
# Providers
##########################################

provider "vmp" {
    api_token = var.credentials.api_token
    ids_client_secret = var.credentials.ids_client_secret
    ids_client_id = var.credentials.ids_client_id
    ids_scope = var.credentials.ids_scope
}

##########################################
# Resources
##########################################
resource "vmp_rules_engine_policy" "httplarge_policy"{
  policy = file("httplarge-policy.json")
  deploy_to = var.rulesEngineEnvironment

  # optional - only needed if using PCC API credentials
  account_number = var.test_customer_info.account_number
  customeruserid = var.test_customer_info.customeruserid
  portaltypeid = var.test_customer_info.portaltypeid
}