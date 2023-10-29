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


variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "instance name"
}
variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "instance db name"
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

variable "vm_web_cores" {
  type        = number
  default     = 2
  description = "numbers vCPU"
}
variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "numbers vCPU db"
}

variable "vm_web_memory" {
  type        = number
  default     = 1
  description = "VM memory Gb"
}
variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "VM memory Gb db"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 5
  description = "core fraction"
}
variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  description = "core fraction db"
}
