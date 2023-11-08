variable "os_image_web" {
  type = string
  default = "ubuntu-2004-lts"
}


variable "yandex_compute_instance_web" {
  type = object({
    vm_name       = string
    cores         = number
    memory        = number
    core_fraction = number
    count_vms     = number
    platform_id   = string
  })

  default = {
      vm_name       = "web"
      cores         = 2
      memory        = 1
      core_fraction = 5
      count_vms     = 2
      platform_id   = "standard-v1"
  }
}

