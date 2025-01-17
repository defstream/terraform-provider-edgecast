resource "ec_waf_scopes" "scopes1" {
  account_number = var.account_number

  scope {
    host {
      is_case_insensitive = false
      type                = "EM"
      values              = ["site1.com/path1","site2.com"]
    }

    limit {
      id                   = "<Rate Rule ID #1>"
      name = "limit action custom"
      duration_sec         = 60
      enf_type             = "CUSTOM_RESPONSE"
      status               = 404
      response_body_base64 = "SGVsbG8sIHdvcmxkIQo="
      response_headers = {
        "header1" = "val1"
        "header2" = "val2"
        "header3" = "val4"
      }
    }

    limit {
      id           = "<Rate Rule ID #2>"
      name          = "limit action drop request"
      duration_sec = 10
      enf_type     = "DROP_REQUEST"
    }

    limit {
      id           = "<Rate Rule ID #3>"
      name = "limit action redirect"
      duration_sec = 10
      enf_type     = "REDIRECT_302"
      url          = "https://mysite.com/redirected2"
    }

    path {
      is_case_insensitive = false
      is_negated          = false
      type                = "GLOB"
      value               = "*"
    }

    acl_audit_action {
      enf_type = "ALERT"
    }

    acl_audit_id = "<Access Rule ID>"

    acl_prod_action {
      name = "acl action"
      enf_type      = "ALERT"
    }

    acl_prod_id = "<Access Rule ID>"

    profile_audit_action {
      enf_type = "ALERT"
    }

    profile_audit_id = "<Managed Rule ID>"

    profile_prod_action {
      name = "managed rule action"
      enf_type             = "CUSTOM_RESPONSE"
      response_body_base64 = "SGVsbG8sIHdvcmxkIQo="
      response_headers = {
        "header1" = "val1"
        "header2" = "val2"
        "header3" = "val3"
      }
      status = 404
    }

    profile_prod_id = "<Managed Rule ID>"

    rules_audit_action {
      enf_type = "ALERT"
    }

    rules_audit_id = "<Custom Rule ID>"

    rules_prod_action {
      name = "custom rule action"
      enf_type             = "BLOCK_REQUEST"
    }

    rules_prod_id = "<Custom Rule ID>"

    bots_prod_id = "<Bots Rule ID>"

    bots_prod_action {
      name = "bots action"
      enf_type = "BROWSER_CHALLENGE"
      valid_for_sec = 60
    }
  }

}
