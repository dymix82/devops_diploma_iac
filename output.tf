output "internal_ip_address_proxy_yandex_cloud" {
  value = "${yandex_compute_instance.proxy.network_interface.0.ip_address}"
}

output "external_ip_address_proxy_yandex_cloud" {
  value = "${yandex_compute_instance.proxy.network_interface.0.nat_ip_address}"
}

#output "public-ip-for-ingress" {
#  value = yandex_compute_instance.proxy[0].network_interface[0].nat_ip_address
#}