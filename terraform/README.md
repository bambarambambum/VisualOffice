# Terraform
С помощью Terraform разворачивается кластер Kubernetes, а так же развертываются Helm Chart'ы
## Файловая структура и описание
- terraform
- - kubernetes
- - - gke.tf - Описание кластера и нод.
- - - vpc.tf - Описание VPC.
- - - terraform.tfvars - Объявление переменных.
- - - variables.tf - Описание переменных.
- - - outputs.tf - Значения для вывода.
- - helm
- - - helm.tf - Описание Helm Chart'ов для запуска.

## Переменные
### terraform.tfvars
| Ключ | Значение |
| ------ | ------ |
| project_id | Имя (id) проекта Google cloud |
| region | Регион |
| zone | Зона |
| machine_type | Тип машины (ноды) |
| gke_num_nodes | Кол-во машин (нод) |

### Запускаем
Убедитесь, что указали название своего проекта в terraform.tfvars
1) Используйте gcloud auth для аутентификации.
```sh
$ gcloud auth application-default login
```
Следуйте инструкции на экране.  
2) Проинициализируйте каталог, содержащий файлы конфигурации Terraform.
```sh
$ terraform init
```
3) Примените конфигурацию.
```sh
$ terraform apply
```
Для запуска Helm Chart'ов, перейдите в папку helm  
```sh
$ terraform init
$ terraform apply
```
Для удаления развертнутой инфраструктуры, воспользуйтесь командой:
```sh
$ terraform destroy
```
