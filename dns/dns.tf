# Configure the DNSimple provider
variable "dnsimple_token" { default = "1234" }
variable "dnsimple_email" { default = "fake@email.com" }
variable "dnsimple_domain" { default = "terraform.rocks" }

provider "dnsimple" {
  token = "${var.dnsimple_token}"
  email = "${var.dnsimple_email}"
}

# Create a record
resource "dnsimple_record" "terraform" {
  domain = "${var.dnsimple_domain}"
  name = "terraformtest"
  value = "${aws_instance.web.0.public_ip}"
  type = "A"
  ttl = 3600
}
