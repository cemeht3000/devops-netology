# Домашнее задание к занятию «Основы Terraform. Yandex Cloud»
## Задание 1
1. Изучил проект.
2. Переименовал файл personal.auto.tfvars_example в personal.auto.tfvars. Заполнил переменные: идентификаторы облака, токен доступа.
3. Записал его pub часть ключа ssh в переменную ***vms_ssh_root_key***.
4. Инициализировал проект, выполнил код.
   
Ошибки:

platform_id = "standart-v4", ошибки в ресурсе, должно быть standard.
И согласно документации https://cloud.yandex.ru/docs/compute/concepts/vm-platforms платформы могут быть только v1, v2 и v3.

cores         = 1
Согласно документации https://cloud.yandex.ru/docs/compute/concepts/performance-levels, минимальное количество ядер = 2

5. Параметр "preemptible = true" применяется в том случае, если нужно сделать виртуальную машину прерываемой, то есть возможность остановки ВМ в любой момент. Применятся если с момента запуска машины прошло 24 часа либо возникает нехватка ресурсов для запуска ВМ.

Параметр "core_fraction=5" указывает базовую производительность ядра в процентах. Указывается для экономии ресурсов.



VM создана:
![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/b9060467-e313-4531-ac8d-9dc7d0340648)


Подключение по SSH:

![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/a47b39fe-84b4-486a-a905-3fc4ea46d59e)

## Задание 2

1. Изучил файлы проекта.
2. Заменил все хардкод-значения для ресурсов **yandex_compute_image** и **yandex_compute_instance** на отдельные переменные.
![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/0e1064d5-7744-4471-8bbd-dbd9df88ce4e)

3. Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их default прежними значениями из main.tf.
   
![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/331c6925-bbd1-4027-ae8d-1c4a83d9b255)

4. Проверьте terraform plan. Изменений быть не должно.
   
![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/7871ed81-c1f4-40f7-aaa0-56279e606d05)


## Задание 3

Создал в корне проекта файл 'vms_platform.tf' . Перенес в него все переменные первой ВМ. Скопировал блок ресурса и создал с его помощью вторую ВМ в файле main.tf: "netology-develop-platform-db" , cores = 2, memory = 2, core_fraction = 20. Объявил её переменные с префиксом vm_db_ в том же файле ('vms_platform.tf').
Применил изменения.

![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/89ffe8bc-1a71-48fc-9d74-8732bde49402)

![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/25904269-916f-489b-b4d9-093423be7a01)


## Задание 4

Объявил в файле outputs.tf output типа map, содержащий { instance_name = external_ip } для каждой из ВМ.

![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/1291f65c-2b08-4b38-a5b3-9259abbeccf6)

![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/22cb7384-8286-4663-8174-66af0cb389f2)


