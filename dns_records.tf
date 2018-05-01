variable "dns_record_website" {
  type = "string"
	default = "46.4.77.12"
}
variable "dns_record_mx" {
  type = "list"
  default = ["10 mx1.zenbox.pl", "20 mx2.zenbox.pl", "30 mx3.zenbox.pl"]
}
variable "dns_record_at_hs" {
  type = "string"
  default = "213.192.75.118"
}
variable "dns_record_rzeczy" {
  type = "string"
  default = "ns11.linuxpl.com"
}
variable "dns_record_wiki" {
  type = "list"
  default = ["dns.smarthost.pl", "dns2.smarthost.pl", "dns3.smarthost.pl"]
}
