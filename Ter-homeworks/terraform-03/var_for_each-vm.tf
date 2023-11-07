variable "os_image" {
  type    = string
  default = "ubuntu-2004-lts"
}

variable "vm_resources" {
  type = list(object({ 
    vm_name       = string 
    cpu           = number
    ram           = number 
    disk          = number
    core_fraction = number
    platform_id   = string 
     }))
     default = [
     {
        vm_name       = "main" 
        cpu           = 2
        ram           = 2 
        disk          = 5
        core_fraction = 5
        platform_id   = "standard-v1"
     },
     {
      vm_name         = "replica" 
        cpu           = 4
        ram           = 4 
        disk          = 10
        core_fraction = 5
        platform_id   = "standard-v1"
     }
     ]
}