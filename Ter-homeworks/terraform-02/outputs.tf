output "VMs" {
  value = {
    instance_name_web = yandex_compute_instance.platform_web.name
    external_ip_web = yandex_compute_instance.platform_web.network_interface.0.nat_ip_address
    instance_name_db = yandex_compute_instance.platform_db.name
    external_ip_db = yandex_compute_instance.platform_db.network_interface.0.nat_ip_address
  }
}