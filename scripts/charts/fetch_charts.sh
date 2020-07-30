#!/bin/bash
set -e
echo -e "${GREEN}Добавляем репозитории Helm...${NORMAL}"
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo add jetstack https://charts.jetstack.io
helm repo add gitlab https://charts.gitlab.io
helm repo update
echo -e "${GREEN}Добавление репозиториев Helm завершено!${NORMAL}"
echo -e "${GREEN}Устанавливаем необходимые Helm Chart'ы...${NORMAL}"
cd kubernetes/charts
helm fetch stable/gitlab --untar
helm fetch stable/grafana --untar
helm fetch stable/prometheus --untar
helm fetch stable/prometheus-mysql-exporter --untar
echo -e "${GREEN}Yеобходимые Helm Chart'ы установлены!${NORMAL}"