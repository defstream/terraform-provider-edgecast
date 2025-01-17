resource "ec_waf_access_rule" "access_rule_1" {
  account_number                = "<Account Number>"
  name                          = "Access Rule #1"
  response_header_name          = "my-response-header-name"
  allowed_http_methods          = ["GET", "POST"]
  allowed_request_content_types = ["application/json","text/html"]
  disallowed_extensions         = [".bat", ".cgi"]
  disallowed_headers            = ["reserved-header-1", "x-reserved-header"]


#Note: ASN access controls must be integer values
  asn {
    accesslist = [12, 200, 465]
    blacklist  = [13, 201, 466]
    whitelist  = [14, 202, 467]
  }

  cookie {
    accesslist = ["MaybeTrustedCookie1", "MaybeTrustedCookie2"]
    blacklist  = ["UntrustedCookie1", "UntrustedCookie2"]
    whitelist  = ["TrustedCookie1", "TrustedCookie2"]
  }

  country {
    accesslist = ["AU", "NZ"]
    blacklist  = ["GB", "EE"]
    whitelist  = ["US", "CAN"]
  }

  ip {
    accesslist = ["10.10.10.114", "10.10.10.115"]
    blacklist  = ["10:0:1::0:3", "10:0:1::0:4"]
    whitelist  = ["10.10.10.200", "10.10.10.201"]
  }

  referer {
    accesslist = ["https://maybetrusted.com", "http://maybestrusted2.com"]
    blacklist  = ["https://untrusted.com", "https://untrusted2.com"]
    whitelist  = ["https://trusted.com", "https://trusted2.com"]
  }

  url {
    accesslist = ["/maybe-trusted", "/maybe-trusted-2"]
    blacklist  = ["/untrusted", "/untrused/.*"]
    whitelist  = ["/trusted-path", "/trusted-path/.*"]
  }

  user_agent {
    accesslist = ["Mozilla\\s.*", "Opera\\s.*"]
    blacklist  = ["curl.*", "PostmanRuntime.*"]
    whitelist  = ["internal-tool/v1", "internal-tool/v2"]
  }
}
