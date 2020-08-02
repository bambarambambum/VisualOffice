### VisualOffice - Практики и инструменты DevOps
[![Build Status](https://travis-ci.com/bambarambambum/visualoffice-.svg?branch=master)](https://travis-ci.com/bambarambambum/visualoffice-)
Финальный проект по отработке практик и инструментов DevOps  

## Остановитесь на мгновение...
Для запуска проекта вам необходим домен! :confused:  
Что делать? Прежде чем продолжить, сделайте следующее: [README_DOMAIN.md](https://github.com/bambarambambum/VisualOffice/blob/master/README_DOMAIN.md)  
## Screencast (old version)

https://www.youtube.com/watch?v=WajkV-tcnCE

## Инструменты и компоненты
Про каждый инструмент и/или компонент вы можете почитать подробнее.
| Инструмент/Компонент | Описание |
| ------ | ------ |
| Terraform | [terraform/README.md](https://github.com/bambarambambum/VisualOffice/tree/master/terraform) |
| Helm Charts | [kubernetes/README.md](https://github.com/bambarambambum/VisualOffice/blob/master/kubernetes) |
| Prometheus | [kubernetes/charts_templates/prometheus/README.md](https://github.com/bambarambambum/VisualOffice/blob/master/kubernetes/charts_templates/prometheus) |
| Prometheus Mysql Exporter | [kubernetes/charts_templates/prometheus-mysql-exporter/README.md](https://github.com/bambarambambum/VisualOffice/blob/master/kubernetes/charts_templates/prometheus-mysql-exporter) |
| Grafana | [kubernetes/charts_templates/grafana/README.md](https://github.com/bambarambambum/VisualOffice/blob/master/kubernetes/charts_templates/grafana) |
| Gitlab CI/CD | [gitlab_ci/README.md](https://github.com/bambarambambum/VisualOffice/blob/master/gitlab_ci) |
| Docker | [docker/README.md](https://github.com/bambarambambum/VisualOffice/blob/master/docker) |
| Скрипты | [scripts/README.md](https://github.com/bambarambambum/VisualOffice/blob/master/scripts) |
| Приложение VisualOffice | https://github.com/bambarambambum/VisualOffice-App |
## Подготовка
Клонируем репозиторий
```sh
$ git clone https://github.com/bambarambambum/VisualOffice
```
Необходимо отредактировать скрипт ***environment.sh.example***, указав свои данные. Остальные файлы будут автоматически отредактированы, основываясь на данных из этого скрипта.  
Далее будут приводиться только те значения, которые обязательны к изменению. Не забудьте удалить расширение ***.example***
### visualoffice/scripts/environment.sh.example
| Значение | Описание |
| ------ | ------ |
| GIT_EMAIL | Адрес электронной почты для Git |
| GIT_USER | Имя пользователя для Git |
| PROJECT_ID | Google Cloud Project ID |
| USER_NAME | Имя пользователя Docker Hub |
| DNS_ZONE_NAME | Имя зоны в Cloud DNS |
| DNS_DOMAIN_NAME | Имя вашего домена |
## Запуск проекта
1) Подготавливаем окружение.
```sh
$ make before_run
```
Вводим все учетные данные и пароли, которые будут затребованы.  
***Теперь из директории visualoffice вводим команду которая применит переменные окружения:***
```sh
source ./scripts/env/environment.sh
```
2) Запускаем проект
```sh
$ make run
```
3) Для удаления кластера (а с ним и всего, что в нём есть) можно использовать команду:
```sh
$ make destroy
```
## Проверка
Переходим по адресам
* https://visualoffice.example.com/
* https://prometheus.example.com/
* https://gitlab.example.com/
* https://grafana.example.com/
* - Логин: admin
* - Пароль: admin

## Подготовка Gitlab
<details><summary>Подготовка Gitlab</summary>

1) Необходимо авторизоваться в https://gitlab.example.com/
Для получения пароля root воспользуйтесь следующей командой:  
```kubectl get secret -n application gitlab-gitlab-initial-root-password -ojsonpath='{.data.password}' | base64 --decode ; echo```
Так же, для удобства рекомендую сменить пароль root'а.  
2) Создать группу с вашим именем пользователя Docker Hub
3) Прописать 3 переменные в свежесозданной группе
```
CI_REGISTRY_USER - логин в Docker Hub
CI_REGISTRY_PASSWORD - пароль от Docker Hub
URL - название вашего домена (example.com)
```
3) Создать внутри группы 2 проекта, один с именем visualoffice, второй с именем visualoffice-deploy
4) Создать триггер в проекте visualoffice-deploy https://docs.gitlab.com/ee/ci/triggers/ (пункт Adding a new trigger)
5) Проверить URL вызова триггера и вписать ID триггера в visualoffice/.gitlab-ci.yml
```
# Trigger for deploy to staging #
release_deploy:
  stage: release_deploy
  variables:
    TRIGGER_TOKEN: 0dsd2fse946c0esfar4sfvc8b68d9e <------- ID триггера
...
  script:
    - >
      curl -X POST \
        -F token="$TRIGGER_TOKEN" \
        -F ref="$REF" \
        https://gitlab.$URL/api/v4/projects/2/trigger/pipeline <-------- URL вызова триггера
```
4) Для запуска pipeline'ов, нужно отправить файлы в репозитории. Делаем это командой:
```sh
make gitlab_prepare_repo
```
5) Теперь можно проверять pipeline'ы
</details>