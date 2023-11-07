data "yandex_compute_image" "storage" {
  family = var.os_image_storage
}
resource "yandex_compute_disk" "disks" {
  name  = "${var.storage_secondary_disk.name}-${count.index+1}"
  type  = var.storage_secondary_disk.type
  size  = var.storage_secondary_disk.size
  count = var.storage_secondary_disk.count
}
resource "yandex_compute_instance" "storage" {
  name            = var.yandex_compute_instance_storage.name
  platform_id     = var.yandex_compute_instance_storage.platform_id
   
  resources {
    cores         = var.yandex_compute_instance_storage.cores
    memory        = var.yandex_compute_instance_storage.memory
    core_fraction = var.yandex_compute_instance_storage.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id    = data.yandex_compute_image.storage.image_id
      type        = var.boot_disk_storage.type
      size        = var.boot_disk_storage.size
    }   
  }
  network_interface { 
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [
      yandex_vpc_security_group.example.id
    ]
  }
 metadata = {
    ssh-keys = "ubuntu:${local.ssh-keys}"
  }
  scheduling_policy {
    preemptible = true
  }
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disks.*.id
    content {
      disk_id = secondary_disk.value
  }
  }
}