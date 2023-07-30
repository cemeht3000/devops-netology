## Задача 1

Создайте собственный образ любой операционной системы (например, debian-11) с помощью Packer версии 1.5.0 ([инструкция](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/packer-quickstart)).

Чтобы получить зачёт, вам нужно предоставить скриншот страницы с созданным образом из личного кабинета YandexCloud.

### Решение
![image](https://github.com/cemeht3000/devops-netology/assets/137440614/4075f6a7-58c0-4809-81bb-3db8b835b77f)



## Задача 2

**2.1.** Создайте вашу первую виртуальную машину в YandexCloud с помощью web-интерфейса YandexCloud.        

**2.2.*** **(Необязательное задание)**      
Создайте вашу первую виртуальную машину в YandexCloud с помощью Terraform (вместо использования веб-интерфейса YandexCloud).
Используйте Terraform-код в директории ([src/terraform](https://github.com/netology-group/virt-homeworks/tree/virt-11/05-virt-04-docker-compose/src/terraform)).

Чтобы получить зачёт, вам нужно предоставить вывод команды terraform apply и страницы свойств, созданной ВМ из личного кабинета YandexCloud.

### Решение

**2.1**
![image](https://github.com/cemeht3000/devops-netology/assets/137440614/aa7a9393-1269-4221-a657-96f710a4c21d)

**2.2.*** 
```bash
palnikov@myserv:~/terra$ terraform apply
yandex_vpc_network.default: Refreshing state... [id=enp39lk8ir2r6cnr8dvm]
yandex_vpc_subnet.default: Refreshing state... [id=e9bfhcp6cifgfuqqrcic]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # yandex_compute_instance.node01 will be created
  + resource "yandex_compute_instance" "node01" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hostname                  = "node01.netology.cloud"
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                centos:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCXxMu4CXm9Nw8jbfcRwOoVjQDFvn7umTu1h8TMIz/MTw1foS/eeiT1sJksPkovzR5qJ9cHVoZJqtk/pq6UQjuxF7fcdt0Fvjtag8ivUHC8yDMn28zJQiX9LEWP7XT4B+F1jYdomsQyY8s0p0EFrr1BLB6ysFe6IeAiNuTlYLbRwzbcQp5oLvjtZ6qF6lLH4or898M2/XheEV+yFKQgsRyEIo6LKkwSti7qfSi2uGrjyLZWVT0+SWmtAAjeYsqORAILy5yKJE1tRFkwXGH1ZzahciTK+w3GvrSZrZaC8Zs8Nm/P6ppXEQGVPlLphK/TyJi82EQKYeKBnCzso8yzhJOoPtNAPj6lhn/6uu10zMwbI28pwNd1LEFl+iYAhJXHXtezTps2CKeVPD6P10id5N1XRKSyqbUo4XQW2K1WZ8TWbenzJY0S2pD6W4yUzRm97J+rsXNT0gD4w9nUPjCXo4WegJD7SKNg581h2tcbji5koG+rJSGRruhsI9IJ72ZMT0U= palnikov@myserv
            EOT
        }
      + name                      = "node01"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-b"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd873vsdj1s3ik80u6tu"
              + name        = "root-node01"
              + size        = 50
              + snapshot_id = (known after apply)
              + type        = "network-nvme"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 8
          + memory        = 8
        }
    }

  # yandex_vpc_subnet.default must be replaced
-/+ resource "yandex_vpc_subnet" "default" {
      ~ created_at     = "2023-07-30T19:00:23Z" -> (known after apply)
      ~ folder_id      = "b1gtv3r4aq9sunq9f3qq" -> (known after apply)
      ~ id             = "e9bfhcp6cifgfuqqrcic" -> (known after apply)
      ~ labels         = {} -> (known after apply)
        name           = "subnet"
      ~ v6_cidr_blocks = [] -> (known after apply)
      ~ zone           = "ru-central1-a" -> "ru-central1-b" # forces replacement
        # (2 unchanged attributes hidden)
    }

Plan: 2 to add, 0 to change, 1 to destroy.

Changes to Outputs:
  + external_ip_address_node01_yandex_cloud = (known after apply)
  + internal_ip_address_node01_yandex_cloud = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

yandex_vpc_subnet.default: Destroying... [id=e9bfhcp6cifgfuqqrcic]
yandex_vpc_subnet.default: Destruction complete after 10s
yandex_vpc_subnet.default: Creating...
yandex_vpc_subnet.default: Creation complete after 2s [id=e2lj01vcdinr6br73fpt]
yandex_compute_instance.node01: Creating...
yandex_compute_instance.node01: Still creating... [10s elapsed]
yandex_compute_instance.node01: Still creating... [20s elapsed]
yandex_compute_instance.node01: Still creating... [30s elapsed]
yandex_compute_instance.node01: Still creating... [40s elapsed]
yandex_compute_instance.node01: Still creating... [50s elapsed]
yandex_compute_instance.node01: Still creating... [1m0s elapsed]
yandex_compute_instance.node01: Creation complete after 1m7s [id=epdsp9r9ibl14dubp8d3]

Apply complete! Resources: 2 added, 0 changed, 1 destroyed.

Outputs:

external_ip_address_node01_yandex_cloud = "62.84.121.237"
internal_ip_address_node01_yandex_cloud = "192.168.101.12"
palnikov@myserv:~/terra$ 
```
![image](https://github.com/cemeht3000/devops-netology/assets/137440614/8b024770-25c5-4f8e-8c5b-f2bf9c0eb8a9)
