# Helm Charts
ФАЙЛ БУДЕТ ДОПОЛНЯТЬСЯ
С помощью Helm Charts происходит развертывание приложения по шаблонам в кластере Kubernetes.
Используемая версия Helm - v3
## Файловая структура
- kubernetes
- - charts
- - - mysql
- - - - templates
- - - - Chart.yaml
- - - - values.yaml
- - - usersapi
- - - -  templates
- - - - Chart.yaml
- - - - values.yaml
- - - webappsite
- - - - templates
- - - - Chart.yaml
- - - - values.yaml
- - - visualoffice
- - - - charts
- - - - requirements.yaml
- - - - Chart.yaml
- - - - values.yaml

## Описание Chart'ов
mysql - База данных MySQL
webappsite - Веб-интерфейс и карта приложения.
usersapi - Сервис для взаимодействия (получение, сохрание пользователей) с базой данных.
visualoffice - Зависимости Chart

## Переменные
### mysql - values.yaml
| Ключ | Значение | Описание |
| ------ | ------ | ----- |
| mysqlRootPassword: | VeryStrongPassword | Пароль root-пользователя MySQL |
| mysqlDatabase: | visualoffice | База данных, создаваемая для приложения |
| mysqlUser: | visualoffice | Пользователь для базы данных |
| mysqlPassword: | VeryStrongPassword | Пароль пользователя для базы данных |
| storageSpec: | | |
| storageClass | - | Класс хранилища (pd-standard или pd-sdd (если пусто: pd-ssd)) |
| storageValue | - | Объем хранилища (если пусто: 2Gi) |
| image: |  |  |
| repository: | androsovm/mysql | Имя Docker Hub репозитория |
| tag: | test | Тэг |

### usersapi - values.yaml
| Ключ | Значение | Описание |
| ------ | ------ | ----- |
| databaseHost: | - | Имя хоста базы данных MySQL (По-умолчанию: Берется имя сервиса MySQL) |
| databaseUser: | visualoffice | Пользователь для подключения к базе данных (databaseUser = mysqlUser) |
| databaseUserPassword: | VeryStrongPassword | Пароль пользователя базы данных (mysqlUser = mysqlPassword) |
| mysqlPassword: | VeryStrongPassword | Пароль пользователя для базы данных |
| service: |  |  |
| internalPort: | 80 | Внутренний порт сервиса |
| externalPort: | 80 | Внешний порт сервиса |
| image: |  |  |
| repository: | androsovm/usersapi | Имя Docker Hub репозитория |
| tag: | test | Тэг |
### webappsite - values.yaml
| Ключ | Значение | Описание |
| ------ | ------ | ----- |
| usersapiHost: | - | Имя хоста сервиса  (По-умолчанию: Берется имя сервиса usersapi) |
| service: |  |  |
| internalPort: | 80 | Внутренний порт сервиса |
| externalPort: | 80 | Внешний порт сервиса |
| image: |  |  |
| repository: | androsovm/webappsite | Имя Docker Hub репозитория |
| tag: | test | Тэг |
| ingress: |  |  |
| class: | nginx | Класс ingress'a |
| host: | - | Адрес хоста (по-умолчанию: имя сервиса webappsite) |

### Запускаем
* Убедитесь, что установлен helm3, kubectl

Загрузим все зависимости (из директории kubernetes/charts)
```sh
$ helm dep update visualoffice/
```
Установим Chart'ы
```sh
$ helm install visualoffice visualoffice
```
Если нужно указать namespace, пишем:
```sh
$ helm install visualoffice visualoffice -n test --create-namespace
```
Для обновления конфигурации Chart'a:
```sh
$ helm upgrade visualoffice visualoffice
```
Для просмотра статуса Chart'a:
```sh
$ helm status visualoffice
```
