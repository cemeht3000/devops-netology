### Домашнее задание к занятию "5.2. Применение принципов IaaC в работе с виртуальными машинами"

#### Задача 1.  
- Опишите своими словами основные преимущества применения на практике IaaC паттернов.
```
- Ускорение процесса подготовки и предоставления инфраструктуры: позволяет быстрее конфигурировать инфраструктуру и направлен
  на обеспечение прозрачности.
- Восстановление: выявление проблем в конфигурации обеспечивает быстрое восстановление после сбоев.
- Масштабируемость: развертывания инфраструктуры с помощью IaaC повторяемы и предотвращают проблемы во время
  выполнения
```
- Какой из принципов IaaC является основополагающим?
```
Идемпотентность - свойство объекта или операции при повторном применении операции к объекту давать тот же результат,
что и при первом.
```
#### Задача 2
- Чем Ansible выгодно отличается от других систем управление конфигурациями?
```
  Ansible использует существующую инфраструктуру, в то время как другие требуют установки специального окружения.
 При неуспешной доставке конфигурации на сервер, Ansible уведомит об этом. У Ansible из "коробки" присутствует
 большое количество модулей.
```
- Какой, на ваш взгляд, метод работы систем конфигурации более надёжный — push или pull?


#### Задача 4

```
palnikov@myserv:~$ vagrant up
Bringing machine 'server1.netology' up with 'virtualbox' provider...
==> server1.netology: Importing base box 'bento/ubuntu-20.04'...
==> server1.netology: Matching MAC address for NAT networking...
==> server1.netology: Setting the name of the VM: server1.netology
==> server1.netology: Clearing any previously set network interfaces...
==> server1.netology: Preparing network interfaces based on configuration...
    server1.netology: Adapter 1: nat
    server1.netology: Adapter 2: hostonly
==> server1.netology: Forwarding ports...
    server1.netology: 22 (guest) => 20011 (host) (adapter 1)
    server1.netology: 22 (guest) => 2222 (host) (adapter 1)
==> server1.netology: Running 'pre-boot' VM customizations...
==> server1.netology: Booting VM...
==> server1.netology: Waiting for machine to boot. This may take a few minutes...
    server1.netology: SSH address: 127.0.0.1:2222
    server1.netology: SSH username: vagrant
    server1.netology: SSH auth method: private key
    server1.netology: Warning: Connection reset. Retrying...
    server1.netology: Warning: Connection reset. Retrying...
==> server1.netology: Machine booted and ready!
==> server1.netology: Checking for guest additions in VM...
    server1.netology: The guest additions on this VM do not match the installed version of
    server1.netology: VirtualBox! In most cases this is fine, but in rare cases it can
    server1.netology: prevent things such as shared folders from working properly. If you see
    server1.netology: shared folder errors, please make sure the guest additions within the
    server1.netology: virtual machine match the version of VirtualBox you have installed on
    server1.netology: your host and reload your VM.
    server1.netology: 
    server1.netology: Guest Additions Version: 7.0.6 r155176
    server1.netology: VirtualBox Version: 6.1
==> server1.netology: Setting hostname...
==> server1.netology: Configuring and enabling network interfaces...
==> server1.netology: Mounting shared folders...
    server1.netology: /vagrant => /home/palnikov
==> server1.netology: Running provisioner: ansible...
    server1.netology: Running ansible-playbook...

PLAY [nodes] *******************************************************************

TASK [Gathering Facts] *********************************************************
ok: [server1.netology]

TASK [Create directory for ssh-keys] *******************************************
ok: [server1.netology]

TASK [Addings rsa-keys in /root/.ssh/authorized_keys] **************************
ok: [server1.netology]

TASK [Checking DNS] ************************************************************
changed: [server1.netology]

TASK [Installing tools] ********************************************************
ok: [server1.netology] => (item=['git', 'curl'])

TASK [Installing docker] *******************************************************
changed: [server1.netology]

TASK [Add the current user to docker group] ************************************
ok: [server1.netology]

PLAY RECAP *********************************************************************
server1.netology           : ok=7    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

palnikov@myserv:~$ vagrant ssh
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-144-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Sun 23 Jul 2023 02:03:42 PM UTC

  System load:  0.22               Users logged in:          0
  Usage of /:   13.5% of 30.34GB   IPv4 address for docker0: 172.17.0.1
  Memory usage: 22%                IPv4 address for eth0:    10.0.2.15
  Swap usage:   0%                 IPv4 address for eth1:    192.168.56.11
  Processes:    139

 * Introducing Expanded Security Maintenance for Applications.
   Receive updates to over 25,000 software packages with your
   Ubuntu Pro subscription. Free for personal use.

     https://ubuntu.com/pro


This system is built by the Bento project by Chef Software
More information can be found at https://github.com/chef/bento
Last login: Sun Jul 23 13:40:34 2023 from 10.0.2.2

vagrant@server1:~$ sudo docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
