resource "ec_customer_user" "my_customer_user" {
  account_number = "A1234"
  first_name     = "Admin_First_Name"
  last_name      = "Admin_Last_Name"
  email          = "Admin@{domain}.com"
  is_admin       = true # cannot be modified after user creation

  #optional
  address1 = ""
  address2 = ""
  city = ""
  state = ""
  country = ""
  fax = ""
  mobile = ""
  phone = ""
  title = ""
  zip = ""
}
