resource "ec_origin" "origin_images_httplarge" {
    account_number = "A1234"
    directory_name = "images"
    host_header = "images.exampleorigin.com:443"
    media_type_id = 3 # 3: HTTP Large, 8: HTTP Small, 14: ADN
    network_configuration = 1 # 1: default, 2: IPv6 preferred, 3: IPv4 preferred, 4: IPv4 only, 5: IPv6 only
    load_balancing_scheme_http = "PF" # RR: Round Robin  PF: Primary/Failover.
    origin_hostname_http {
        name = "http://images-origin-1.exampleorigin.com:80"
        is_primary = 1 # 0: false, 1: true
        ordinal = 0
    }
    origin_hostname_http {
        name = "http://images-origin-2.exampleorigin.com:80"
        is_primary = 0 # 0: false, 1: true
        ordinal = 1
    }
    load_balancing_scheme_https = "PF" # RR: Round Robin  PF: Primary/Failover.
    origin_hostname_https {
        name = "https://images-origin-1.exampleorigin.com:443"
        is_primary = 1 # 0: false, 1: true
        ordinal = 0
    }
    origin_hostname_https {
        name = "https://images-origin-2.exampleorigin.com:443"
        is_primary = 0 # 0: false, 1: true
        ordinal = 1
    }
    shield_pop {
        pop_code = "LAA"
    }

    shield_pop {
        pop_code = "LHB"
    }
}

resource "ec_origin" "origin_cart_adn" {
    account_number = "A1234"
    directory_name = "shopping"
    host_header = "cart.exampleorigin.com:443"
    media_type_id = 14 # 3: HTTP Large, 8: HTTP Small, 14: ADN
    network_configuration = 1 # 1: default, 2: IPv6 preferred, 3: IPv4 preferred, 4: IPv4 only, 5: IPv6 only
    follow_redirects = false
    validation_url = "https://cart.exampleorigin.com/logo.jpg"
    load_balancing_scheme_http = "PF" # RR: Round Robin  PF: Primary/Failover.
    origin_hostname_http {
        name = "http://cart-origin-1.exampleorigin.com:80"
        is_primary = 1 # 0: false, 1: true
        ordinal = 0
    }
    origin_hostname_http {
        name = "http://cart-origin-2.exampleorigin.com:80"
        is_primary = 0 # 0: false, 1: true
        ordinal = 1
    }
    load_balancing_scheme_https = "PF" # RR: Round Robin  PF: Primary/Failover.
    origin_hostname_https {
        name = "https://cart-origin-1.exampleorigin.com:443"
        is_primary = 1 # 0: false, 1: true
        ordinal = 0
    }
    origin_hostname_https {
        name = "https://cart-origin-2.exampleorigin.com:443"
        is_primary = 0 # 0: false, 1: true
        ordinal = 1
    }
}
