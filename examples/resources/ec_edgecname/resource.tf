resource "ec_edgecname" "edgecname_edgecast_origin" {
    account_number = "<account_number>"
    name = "<cname_url>"
    dir_path = "/ec/origin/path"
    enable_custom_reports = 1 # True = 1, False = 0
    media_type_id = 3 # HTTPLarge = 3, HTTP Small = 8, ADN = 14
    origin_id = -1
}

resource "ec_edgecname" "edgecname_customer_origin" {
    account_number = "<account_number>"
    name = "<cname_url>"
    dir_path = "/origin/path/to/content"
    enable_custom_reports = 1 # True = 1, False = 0
    media_type_id = 3 # HTTPLarge = 3, HTTP Small = 8, ADN = 14
    origin_id = 100
}