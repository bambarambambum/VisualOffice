#!/bin/bash
# SERVICE VARIABLES
export GREEN="\033[0;32m"
export NORMAL="\033[0m"
# GLOBAL VARIABLES
## Git (обязательно к изменению)
export GIT_EMAIL=Mikh.Androsov@gmail.com
export GIT_USER=Mikhail Androsov
export GIT_SSL_NO_VERIFY=1 # Для работы с локальным Gitlab
## Terraform (обязательно к изменению)
export ZONE=europe-west1-c
export PROJECT_ID=docker-275315 # Ваш Google Cloud Project ID
## Docker (обязательно к изменению)
export USER_NAME=username
## Application VisualOffice (можно не менять)
export MYSQL_USER=visualoffice
export MYSQL_PASSWORD=VeryStrongPassword
export MYSQL_DATABASE=visualoffice
export APP_NAME=visualoffice
## Prometheus (Имя Helm Chart релиза, можно не менять)
export PROM_NAME=prometheus
## Grafana (Имя Helm Chart релиза, можно не менять)
export GRAFANA_NAME=grafana
## Gitlab (Имя Helm Chart релиза, можно не менять)
export GITLAB_NAME=gitlab
## DNS Zone (not domain name)
export DNS_ZONE_NAME=visualoffice
export DNS_DOMAIN_NAME=visualoffice.tk