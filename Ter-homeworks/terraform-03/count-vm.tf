data "yandex_compute_image" "web" {
  family = var.os_image_web
}

resource "yandex_compute_instance" "web" {
  name        = "${var.yandex_compute_instance_web.vm_name}-${count.index+1}"
  platform_id = var.yandex_compute_instance_web.platform_id
  
  count = var.yandex_compute_instance_web.count_vms

  resources {
    cores         = var.yandex_compute_instance_web.cores
    memory        = var.yandex_compute_instance_web.memory
    core_fraction = var.yandex_compute_instance_web.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.web.image_id
      type = var.boot_disk_storage.type
      size = var.boot_disk_storage.size
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
}