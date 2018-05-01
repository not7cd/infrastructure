resource "aws_route53_zone" "hs3" {
  name = "hs3.pl"
}

resource "aws_route53_record" "ldap" {
  zone_id = "${aws_route53_zone.hs3.zone_id}"
  name    = "ldap"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.ldap.public_ip}"]
}

resource "aws_route53_record" "website" {
  zone_id = "${aws_route53_zone.hs3.zone_id}"
  name    = "hs3.pl"
  type    = "A"
  ttl     = "300"
  records = ["${var.dns_record_website}"]
}

resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.hs3.zone_id}"
  name    = "www.hs3.pl"
  type    = "A"

  alias {
    name                   = "${aws_route53_record.website.name}"
    zone_id                = "${aws_route53_zone.hs3.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "at_hs" {
  zone_id = "${aws_route53_zone.hs3.zone_id}"
  name    = "at"
  type    = "A"
  ttl     = "300"
  records = ["${var.dns_record_at_hs}"]
}

resource "aws_route53_record" "wiki" {
  zone_id = "${aws_route53_zone.hs3.zone_id}"
  name    = "wiki"
  type    = "NS"
  ttl     = "300"
  records = ["${var.dns_record_wiki}"]
}

resource "aws_route53_record" "rzeczy" {
  zone_id = "${aws_route53_zone.hs3.zone_id}"
  name    = "rzeczy"
  type    = "NS"
  ttl     = "3600"
  records = ["${var.dns_record_rzeczy}"]
}

resource "aws_route53_record" "mx" {
  zone_id = "${aws_route53_zone.hs3.zone_id}"
  name    = "hs3.pl"
  type    = "MX"

  records = [
		"10 mx1.zenbox.pl",
		"20 mx2.zenbox.pl",
		"30 mx3.zenbox.pl",
  ]

  ttl = "300"
}
