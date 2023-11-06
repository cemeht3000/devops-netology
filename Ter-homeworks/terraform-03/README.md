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

   
