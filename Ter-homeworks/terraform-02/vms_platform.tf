variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "vm version"
}
variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "vm db version"
}


variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "platform id"
}
variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "platform db id"
}

variable "vms_resources" {
  type       = map(map(number))
  default = {
    vm_web_resources = {
      cores          = 2
      memory         = 1
      core_fraction  = 5
    }
    vm_db_resources  = {
      cores          = 2
      memory         = 2
      core_fraction  = 20
    }
  }
}

variable "value_metadata" {
  type       = map(string)
  default = {
    serial-port-enable = "1"
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAXgjaCOcXPQjb4atnwMLj/cb8rxZnSBFPqPUyBea1zo palnikov@palnikov-desktop"
    }
  }