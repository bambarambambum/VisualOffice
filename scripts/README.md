# Скрипты
## Файловая схема
- charts
- - fetch_charts.sh - скачивание и распакова Helm Chart'ов.
- - prepare_charts_template.sh - копирование и подготовка шаблонов Helm Chart'ов для их использования.
- dns
- - create_dns_zone_records.sh - Создание необходимых А записей.
- - create_dns_zone.sh - Создание зоны DNS в Cloud DNS.
- docker
- - docker.sh - Сборка и публикация образов (mysql, usersapi, webappsite) в Docker Hub.
- env
- - authorizate.sh - Авторизация и аутентификация в необходимых службах и сервисах.
- - environment.sh - Переменные среды.
- - prepare.sh - Подготовка системы к запуску проекта (обновление системы, установка нужных приложений).
- gitlab
- - prepare_gitlab_ci.sh - Подготовка репозиториев для Gitlab CI/CD
- terraform
- - create_cluster.sh - Создание кластера Kubernetes.
- - deploy_helm.sh - Развертывание Helm Chart'ов
- - destroy.sh - Уничтожение кластера Kubernetes.
- - prepare_vars.sh - Подготовка файла terraform.tfvars
## Запуск
1) Указываем все необходимые значения в файле env/environment.sh.  
Применяем:
```sh
$ source scripts/env/environment.sh
```
2) Запускаем скрипт подготовки машины и окружения.
```sh
$ make before_run
```
3) Запускаем.
```sh
$ make run
```
## Порядок отработки скриптов
После запуска команды ```make run```, скрипты отрабатывают в следующем порядке:
* /scripts/charts/fetch_charts.sh - Скачивание необходимых Helm Chart'ов.
* /scripts/charts/prepare_charts_template.sh - Замена шаблонизированных значений в Helm Chart'ах на рабочие.
* /scripts/gitlab/prepare_gitlab_ci.sh - Скачивание репозитория с кодом приложения, подготовка папки gitlab_ci для работы с Gitlab CI/CD.
* /scripts/docker/docker.sh - Сборка и публикация образов в Docker Hub. Для сборки используется папка gitlab_ci.
* /scripts/terraform/prepare_vars.sh - Подготовка terraform.tfvars.
* /scripts/terraform/create_cluster.sh - Создание кластера Kubernetes с помощью Terraform.
* /scripts/terraform/deploy_helm.sh - Развертывание Helm Chart'ов в кластере Kubernetes c помощью Terraform.
* /scripts/env/dump.sh - Импорт дампа базы приложения VisualOffice.
* /scripts/dns/create_dns_zone.sh - Создание зоны Cloud DNS.
* /scripts/dns/create_dns_zone_records.sh - Создание А-записей в DNS зоне.
* kubectl apply -f kubernetes/cluster-Issuer-staging.yml - Выпуск fake-сертификатов для VisualOffice, Grafana, Prometheus.
