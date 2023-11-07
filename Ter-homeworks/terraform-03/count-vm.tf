data "yandex_compute_image" "web" {
  family = var.os_image_web
}

resource "yandex_compute_instance" "web" {
  name        = "web-${count.index+1}"
  platform_id = "standard-v1"
  
  count = 2

  resources {
    cores  = 2
    memory = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.web.image_id
      type = "network-hdd"
      size = 5
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