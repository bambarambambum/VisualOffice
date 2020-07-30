# Helm Charts
С помощью Helm Charts происходит развертывание приложения и сопутствующих сервисов по шаблонам в кластере Kubernetes.
Используемая версия Helm - v3
## Файловая структура (Основное приложение)
- kubernetes
- - charts
- - - mysql
- - - usersapi
- - - webappsite
- - - visualoffice
- - - ...
- cluster-Issuer-staging.yml
## Файловая структура (Остальные сервисы)
- kubernetes
- - charts
- - - ...
- - - gitlab
- - - grafana
- - - prometheus
- - - prometheus-mysql-exporter

## Описание Chart'ов основного приложения
mysql - База данных MySQL.  
webappsite - Веб-интерфейс и карта приложения.  
usersapi - Сервис для взаимодействия (получение, сохрание пользователей) с базой данных.  
visualoffice - Зависимости Chart.  

## Cекреты
### usersapi- secret.yaml.example
| Ключ | Значение | Описание |
| ------ | ------ | ----- |
| MYSQL_DATABASE | visualoffice | Создаваемая база данных для приложения |
| MYSQL_ROOT_PASSWORD | VeryStrongPassword | Пароль root-пользователя MySQL |
| MYSQL_USER | visualoffice | Создаваемый пользователь для базы данных |
| MYSQL_PASSWORD | VeryStrongPassword | Создаваемый пароль пользователя для базы данных |
### usersapi - secret.yaml.example
| Ключ | Значение | Описание |
| ------ | ------ | ----- |
| MYSQL_DATABASE | visualoffice | Имя базы данных для приложения |
| MYSQL_USER | visualoffice | Пользователь для подключения к базе данных |
| MYSQL_USER_PASSWORD | VeryStrongPassword | Пароль пользователя для подключения к базе данных |
## Переменные
### mysql - values.yaml
| Ключ | Значение | Описание |
| ------ | ------ | ----- |
| storageSpec: | | |
| storageClass | - | Класс хранилища (pd-standard или pd-sdd (если пусто: pd-ssd)) |
| storageValue | - | Объем хранилища (если пусто: 2Gi) |
| image: |  |  |
| repository: | username/mysql | Имя Docker Hub репозитория |
| tag: | test | Тэг |

### usersapi - values.yaml
| Ключ | Значение | Описание |
| ------ | ------ | ----- |
| databaseHost: | - | Имя хоста базы данных MySQL (По-умолчанию: Используется имя сервиса MySQL) |
| service: |  |  |
| internalPort: | 80 | Внутренний порт сервиса |
| externalPort: | 80 | Внешний порт сервиса |
| image: |  |  |
| repository: | username/usersapi | Имя Docker Hub репозитория |
| tag: | test | Тэг |
### webappsite - values.yaml
| Ключ | Значение | Описание |
| ------ | ------ | ----- |
| usersapiHost: | - | Имя хоста сервиса  (По-умолчанию: Используется имя сервиса usersapi) |
| service: |  |  |
| internalPort: | 80 | Внутренний порт сервиса |
| externalPort: | 80 | Внешний порт сервиса |
| image: |  |  |
| repository: | username/webappsite | Имя Docker Hub репозитория |
| tag: | test | Тэг |
| ingress: |  |  |
| class: | nginx | Класс ingress'a |
| host: | visualoffice.visualoffice.tk | Адрес хоста (по-умолчанию: имя сервиса webappsite) |

### Файлы kubernetes
* cluster-Issuer-staging.yml - Создание объекта кластера ClusterIssuer, для выпуска fake-сертификатов.

### Запускаем
Загрузим все зависимости (из директории kubernetes/charts)  
```sh
$ helm dep update visualoffice/
```
Установим Chart'ы  
```sh
$ helm install visualoffice visualoffice/ -n application
```
Для обновления конфигурации Chart'a:  
```sh
$ helm upgrade visualoffice visualoffice  
```
Для просмотра статуса Chart'a:  
```sh
$ helm status visualoffice
```
