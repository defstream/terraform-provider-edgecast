---
# generated by https://github.com/hashicorp/terraform-plugin-docs
page_title: "ec_waf_scopes Resource - terraform-provider-edgecast"
subcategory: ""
description: |-
  
---

# ec_waf_scopes (Resource)

<no value>

## Host and Path
### Required
- **type** (String) Indicates how the system will interpret the comparison 
between the request's hostname or the URL Path and the value defined within the
Value/Values property.

Valid values are:
    - EM: Indicates that request hostname or URL Path must be an exact match
    to one of the case-sensitive values specified in the values property.
    - GLOB: Indicates that the request hostname or URL Path must be an exact
    match to the wildcard pattern defined in the value property.
    - RX: Indicates that the request hostname or URL Path must be an exact
    match to the regular expression defined in the value property.

Note: Apply this Security Application Manager configuration across
all hostnames or URLs by setting this property to "GLOB" and setting
the Value property to "*." This type of configuration is also known as
"Default."

### Optional
- **is_case_insensitive** (Boolean) Indicates whether the comparison between the
requested hostname or URL Path and the values property is case-sensitive.
    Valid values are:
	    True: Case-insensitive
	    False: Case-sensitive
Indicates whether the comparison btween the requested hostname or URL

- **is_negated** (Boolean) Indicates whether this match condition will be 
satisfied when the requested hostname or URL Path matches or does not match the
Value defined by the Value/Values property.
	Valid values are:
		True: Does not match
		False: Matches

- **value** (String) Identifies a value that will be used to identify requests 
that are eligible for this Security Application Manager configuration.

Note: Only valid when Type is set to GLOB or RX

- **values** (List of String) Identifies one or more values used to identify 
requests that are eligible for this Security Application Manager configuration.

Note: Only valid when Type is set to EM

## Audit Actions
### Required
- **type** (String) Set to ALERT. This indicates that malicious traffic will be 
audited.
### Optional
- **name** (String) Indicates the name assigned to this enforcement action 
configuration.

## Prod Actions
### Required
- **enf_type** (String) Indicates the enforcement action that will be applied to 
malicious traffic.

Valid values are:
    - BLOCK_REQUEST: Block Request
    - ALERT: Alert Only
    - REDIRECT_302: Redirect (HTTP 302)
    - CUSTOM_RESPONSE: Custom Response
    - BROWSER_CHALLENGE: Browser Challenge (only valid for Bot Rules)

### Optional
- **name** (String) Indicates the name assigned to this enforcement action 
configuration.
- **response_body_base64** (String) Indicates the response body that will be 
sent to malicious traffic. This value is Base64 encoded.
Note: Only valid when ENFType is set to CUSTOM_RESPONSE

- **response_headers** (Map) Indicates the set of response headers that will be 
sent to malicious traffic.
Note: Only valid when ENFType is set to CUSTOM_RESPONSE

- **status** (Number) Indicates the HTTP status code (e.g., 404) for the custom 
response that will be sent to malicious traffic.
Note: Only valid when ENFType is set to CUSTOM_RESPONSE or BROWSER_CHALLENGE

- **url** (String) Indicates the URL to which malicious requests will be 
redirected.
Note: Only valid when ENFType is set to REDIRECT_302

- **valid_for_sec** (Number) Indicates the length of time in seconds that a 
browser challenge success cookie remains valid. This cookie is assigned when the 
user solves the challenge and prevents further challenges.
Note: Only valid when ENFType is set to BROWSER_CHALLENGE

## Example Usage

```terraform
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
```