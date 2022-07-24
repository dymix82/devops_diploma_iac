resource "yandex_dns_zone" "gavva" {
  name        = "gavva"
  description = "desc"

  labels = {
    label1 = "label-1-value"
  }

  zone             = "gavva.site."
  public           = true
#  private_networks = [yandex_vpc_network.default.id]
}


resource "yandex_dns_recordset" "proxy" {
  zone_id = yandex_dns_zone.gavva.id
  name    = "gavva.site."
  type    = "A"
  ttl     = 100
#  data    = "${yandex_compute_instance.proxy.network_interface.0.nat_ip_address}"
  data = [yandex_compute_instance.proxy.network_interface.0.nat_ip_address]
  depends_on = [yandex_compute_instance.proxy]
}
resource "yandex_dns_recordset" "www" {
  zone_id = yandex_dns_zone.gavva.id
  name    = "www"
  type    = "A"
  ttl     = 100
  data = [yandex_compute_instance.proxy.network_interface.0.nat_ip_address]
  depends_on = [yandex_compute_instance.proxy]
}

resource "yandex_dns_recordset" "grafana" {
  zone_id = yandex_dns_zone.gavva.id
  name    = "grafana"
  type    = "A"
  ttl     = 100
  data = [yandex_compute_instance.proxy.network_interface.0.nat_ip_address]
  depends_on = [yandex_compute_instance.proxy]
}

resource "yandex_dns_recordset" "prometheus" {
  zone_id = yandex_dns_zone.gavva.id
  name    = "prometheus"
  type    = "A"
  ttl     = 100
  data = [yandex_compute_instance.proxy.network_interface.0.nat_ip_address]
  depends_on = [yandex_compute_instance.proxy]
}

resource "yandex_dns_recordset" "alertmanager" {
  zone_id = yandex_dns_zone.gavva.id
  name    = "alertmanager"
  type    = "A"
  ttl     = 100
  data = [yandex_compute_instance.proxy.network_interface.0.nat_ip_address]
  depends_on = [yandex_compute_instance.proxy]
}
resource "yandex_dns_recordset" "gitlab" {
  zone_id = yandex_dns_zone.gavva.id
  name    = "gitlab"
  type    = "A"
  ttl     = 100
  data = [yandex_compute_instance.proxy.network_interface.0.nat_ip_address]
  depends_on = [yandex_compute_instance.proxy]
}


resource "yandex_dns_zone" "local" {
  name         = "local"
  zone         = "gavva.local."
  public       = false  
}

resource "yandex_dns_recordset" "git" {
  zone_id = yandex_dns_zone.local.id
  name    = "gitlab"
  type    = "A"
  ttl     = 100
  data = [yandex_compute_instance.proxy.network_interface.0.ip_address]
  depends_on = [yandex_compute_instance.app]
}
