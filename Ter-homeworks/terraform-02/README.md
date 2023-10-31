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

## Задание 5

В файле locals.tf описал в одном local-блоке имя каждой ВМ, используйте интерполяцию ${..} с несколькими переменными по примеру из лекции.
Заменил переменные с именами ВМ из файла variables.tf на созданные local-переменные.

![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/69206c54-c21d-4d80-bbb7-7bd338aa5262)

![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/1a4c3640-4fe8-46a1-821d-56f11d3e3de4)
![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/6ded0cf0-ec7f-4dc9-86d7-1d694c0f0324)

## Задание 6

1.Вместо использования трёх переменных ".._cores",".._memory",".._core_fraction" в блоке resources {...}, объединил их в переменные типа map с именами "vm_web_resources" и "vm_db_resources". В качестве продвинутой практики попробовал создать одну map-переменную vms_resources и уже внутри неё конфиги обеих ВМ — вложенный map.

![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/8171721d-d4d5-44d8-a18d-25eab7c158b8)


![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/9add7bc5-2233-44f0-8f18-614f9f0fe41b)


![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/8700f88c-0e62-44bd-a9bf-a1d02bb09e9e)


2. Также поступил с блоком metadata {serial-port-enable, ssh-keys}, эта переменная должна быть общая для всех ВМ.

![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/10455294-6fab-4bfa-83a3-85d02da41da1)

Заменил в блоке resource на переменную metadata 

![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/14cd09a2-1b27-48c4-958a-cde5f3285d61)
![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/8b426972-b01b-4d34-8a2c-608602839b5f)

3. Нашел и удалил все более не используемые переменные проекта.
4. Проверил terraform plan. Изменений не было.

![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/8d00a6a9-6905-40fd-9bff-524495ea3fc9)


## Задание 7*
1. Напишите, какой командой можно отобразить второй элемент списка test_list.

![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/6e3e4c6d-7fa0-4446-805f-5900fb5d77f1)

2.Найдите длину списка test_list с помощью функции length(<имя переменной>).

![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/c5f06c70-1a6d-438e-97af-3661011d568f)

3.Напишите, какой командой можно отобразить значение ключа admin из map test_map.

![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/f7a0407d-bc2b-44e0-a0d6-2c56728e60ee)

4. Напишите interpolation-выражение, результатом которого будет: "John is admin for production server based on OS ubuntu-20-04 with X vcpu, Y ram and Z virtual disks", используйте данные из переменных test_list, test_map, servers и функцию length() для подстановки значений.

> {a = "${local.test_map.admin} is admin for ${local.test_list[2]} server based on OS ${local.servers[local.test_list[2]]["image"]} with ${local.servers[local.test_list[2]]["cpu"]} vcpu, ${local.servers[local.test_list[2]]["ram"]} ram and ${length(local.servers[local.test_list[2]]["disks"])} virtual disks"}

![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/8d559b62-4658-48ea-89c5-884196127a68)



