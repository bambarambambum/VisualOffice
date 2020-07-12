# Terraform
С помощью Terraform разворачивается кластер Kubernetes.
## Файловая структура и описание
- terraform
- - gke.tf - описание кластера и нод
- - vpc.tf - описание VPC
- - terraform.tfvars - объявление переменных
- - variables.tf - описание переменных
- - outputs.tf - значения для вывода в консоль.

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
Убедитесь что указали название своего проекта в terraform.tfvars
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
Для удаления развертнутой инфраструктуры, воспользуйтесь командой:
```sh
$ terraform destroy
```
