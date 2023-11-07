# Домашнее задание к занятию «Управляющие конструкции в коде Terraform»

### Задание 1

Изучил проект.   Заполнил токен, ID облака и ID папки пользователя в personal.auto.tfvars.   Инициализировал проект и выполнил код.
   Группа безопвсности создана успешно.

![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/0d97fa5c-ddd4-4e24-ab61-69a2e73e3516)


### Задание 2

1. Создал файл count-vm.tf и описал в нем 2 одинаковые виртуальные машины, которые называются web-1 и web-2:

   ![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/6af0e50b-0b08-4ba3-a3e9-62e34f29c83f)

   Назначил виртуальной машине созданную в первом задании группу безопасности:

   ![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/55ea9ddb-f898-4ecd-aa35-4a774bbaf91d)


2. Создал файл for_each-vm.tf. В нем описал создание двух ВМ с именами "main" и "replica" разных по cpu/ram/disk , используя мета-аргумент for_each loop:

      ![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/7c90f8bf-356e-4980-8f4f-3605c2adb9d8)

3. ВМ из пункта 2.2 должны создаваться после создания ВМ из пункта 2.1.

   ![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/9c167629-4600-4b9a-816d-ba6177145631)

4. Использовал функцию file в local-переменной для считывания ключа ~/.ssh/id_rsa.pub и его последующего использования в блоке metadata, взятому из ДЗ 2.

   ![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/ee2f0b80-e455-40ad-8c1a-638b2e0868cc)
   ![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/d705dd73-db78-4a5a-ad52-9aa5571f9574)

5. Инициализировал проект, выполнил код.
   
   ![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/c0c40937-4863-4335-9ace-5bcc469bd32a)

   ![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/654ece2e-e2ba-46be-a438-d83a08ddd744)


### Задание 3

1. Создал 3 одинаковых виртуальных диска размером 1 Гб с помощью ресурса yandex_compute_disk и мета-аргумента count в файле disk_vm.tf .

   ![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/789d0e2b-b71e-468b-83b2-deba33e276d8)
   
   ![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/a95d9eda-c1f0-47c6-8f6f-92aaf3d14a28)
   

3. Создал одиночную ВМ c именем "storage" . Использовал блок dynamic secondary_disk{..} и мета-аргумент for_each для подключения созданных дополнительных дисков.

   ![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/a60b534d-65b6-4005-a525-8d5019c229f4)

   ![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/2a0b6da1-2fee-470d-9453-83187ca40122)

Результат:

   ![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/67a61abd-37b7-48ec-9af4-60d8003d84fc)

   ![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/c24a5ead-436d-498a-bacc-19e8444d2a86)

   ![изображение](https://github.com/cemeht3000/devops-netology/assets/137440614/f5593f45-9c5c-4a8e-b78f-d59c4f27b2ab)




   
