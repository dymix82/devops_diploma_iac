# Network

resource "yandex_vpc_network" "default" {
  name = "net"
}

resource "yandex_vpc_subnet" "default" {
  name = "subnet"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.default.id}"
  v4_cidr_blocks = ["192.168.101.0/24"]
  route_table_id = "${yandex_vpc_route_table.nat-int.id}"
}

resource "yandex_vpc_subnet" "reserve" {
  name = "subnet2"
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.default.id}"
  v4_cidr_blocks = ["192.168.102.0/24"]
  route_table_id = "${yandex_vpc_route_table.nat-int.id}"
}

resource "yandex_vpc_route_table" "nat-int" {
  network_id = "${yandex_vpc_network.default.id}"
  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = var.grey_ip
  }
}

#resource "yandex_dns_zone" "gavva" {
#  name        = "gavva"
#  description = "desc"
#
#  labels = {
#    label1 = "label-1-value"
#  }
#
#  zone             = "gavva.site."
#  public           = true
#  private_networks = [yandex_vpc_network.default.id]
#}

#resource "yandex_dns_recordset" "rs1" {
#  zone_id = yandex_dns_zone.gavva.id
#  name    = "www"
#  type    = "A"
#  ttl     = 200
#  data    = "${yandex_compute_instance.proxy.network_interface.0.nat_ip_address}"
#}