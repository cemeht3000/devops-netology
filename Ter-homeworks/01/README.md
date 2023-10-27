## Домашнее задание к занятию «Введение в Terraform»

## Задание 1

1. ![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/c8a1f66b-5007-4d90-a4d6-1ebb2a9d1c1b)

2. personal.auto.tfvars

3. "result": "bcm9Tk0qu3GolcKF"

4. Первая ошибка сообщает что отсутсвует имя ресурса. Все блоки ресурсов должны иметь 2 метки, тип и имя.
   
Вторая ошибка говорит, что имя ресурса было указанно не верно. Имя должно начинаться с буквы или символа подчеркивания и может содержать только буквы, цифры, символы подчеркивания и тире. 

Третья ошибка означает, что нет параметров "Ссылка на незадекларированный ресурс" "random_string_FAKE"

Четвертая, неподдерживаемый аттрибут resulT. Ошибка в слове.

5. Исправленный код
```resource "docker_image" "nginx"{
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx1" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string.result}"

  ports {
    internal = 80
    external = 8000
  }
}
```
![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/ed224b20-5a09-489e-8ec8-a33e6d854cdc)

6. Опасность авто подтверждения состоит в том, что если кто-то изменил конфигурацию, то правки применятся сразу после отображения планирования, без возможности анализа ошибок, это может быть источником проблем.

![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/2d5307c8-2aa2-42c4-afe1-777e796d1104)

7. terraform.tfstate.

```{
  "version": 4,
  "terraform_version": "1.5.5",
  "serial": 11,
  "lineage": "347048f0-d956-9377-5552-1ba4f418d0ea",
  "outputs": {},
  "resources": [],
  "check_results": null
}
```

8. Потому что установлен параметр keep_locally = true
   
 keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.

 ## Задание 2*

```
palnikov@palnikov-desktop:~/terraform/ter-homeworks/01$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # virtualbox_vm.vm1 will be created
  + resource "virtualbox_vm" "vm1" {
      + cpus      = 1
      + id        = (known after apply)
      + image     = "https://github.com/kraksoft/vagrant-box-debian/releases/download/7.8.0/debian-7.8.0-amd64.box"
      + memory    = "512 mib"
      + name      = "debian-7.8"
      + status    = "running"
      + user_data = <<-EOT
            Здесь будут данные пользователя
        EOT

      + network_adapter {
          + device                 = "IntelPro1000MTServer"
          + ipv4_address           = (known after apply)
          + ipv4_address_available = (known after apply)
          + mac_address            = (known after apply)
          + status                 = (known after apply)
          + type                   = "nat"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```
![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/836919c5-88ee-4c06-a01d-216cf3b98aaf)
