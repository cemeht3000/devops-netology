variable "os_image_storage" {
  type = string
  default = "ubuntu-2004-lts"
}
variable "yandex_compute_instance_storage" {
  type = object({
    name          = string
    cores         = number
    memory        = number
    core_fraction = number
    platform_id   = string
    zone          = string
  })
  default = {
      name          = "storage"
      cores         = 2
      memory        = 1
      core_fraction = 5
      platform_id   = "standard-v1"
      zone          = "ru-central1-b"
    }
}
variable "boot_disk_storage" {
  type = object({
      size  = number
      type  = string
  })
  default = {
      size  = 5
      type  = "network-hdd"
  }
}
variable "storage_secondary_disk" {
  type = object({
      type       = string
      size       = number
      count      = number
      name       = string
    })
   default = {
        type      = "network-hdd"
        size      = 1
        count     = 3
        name      = "disk"
    }
}