
resource "ec_waf_custom_rule_set" "custom_rule_1" {
  customer_id = "<customer_id>"
  name        = "Custom Rule 1"
  
directive {
      sec_rule {
          name = "Sec Rule 1"
          action {
              id = 66000000 
              msg = "Invalid user agent."
              transformations = ["NONE"]
          }
          operator {
              is_negated = false
              type = "CONTAINS"
              value = "bot"
          }
          variable {
              is_count = false
              match {
                is_negated = false
                is_regex = false
                value = "User-Agent"
              } 
              match {
                  is_negated = false
                  is_regex = false
                  value = "User-Agent"
              }
              type = "REQUEST_HEADERS"
          }
          variable {
              is_count = false
              match {
                is_negated = false
                is_regex = false
                value = "User-Agent"
              } 
              type = "REQUEST_URI"
          }
          chained_rule {
                action {
                id = 66000001 
                msg = "Invalid user agent - chained."
                transformations = ["NONE"]
            }
            operator {
                is_negated = false
                type = "CONTAINS"
                value = "bot"
            }
            variable {
                is_count = false
                match {
                    is_negated = false
                    is_regex = false
                    value = "User-Agent"
                } 
                match {
                    is_negated = false
                    is_regex = false
                    value = "User-Agent"
                }
                type = "REQUEST_HEADERS"
            }
          }
        }
    }
}
