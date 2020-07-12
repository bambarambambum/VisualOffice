#!/bin/bash
cd ../kubernetes/charts
helm install ${APP_NAME} visualoffice
echo -e "${GREEN}Chart ${APP_NAME} installed.${NORMAL}"
helm install ${GITLAB_NAME} -f gitlab-omnibus/values.yaml gitlab-omnibus
echo -e "${GREEN}Chart ${GITLAB_NAME} installed.${NORMAL}"
helm install ${PROM_NAME} -f prometheus/custom_values.yaml prometheus
echo -e "${GREEN}Chart ${PROM_NAME} installed.${NORMAL}"
helm install ${GRAFANA_NAME} -f grafana/custom_values.yaml grafana
echo -e "${GREEN}Chart ${GRAFANA_NAME} installed.${NORMAL}"
helm install nginx stable/nginx-ingress
echo -e "${GREEN} Chart nginx-ingress installed.${NORMAL}"
helm install mysql-exporter -f prometheus-mysql-exporter/custom_values.yaml prometheus-mysql-exporter
echo -e "${GREEN} Chart mysql-exporter installed.${NORMAL}"
helm install mysql-exporter -f prometheus-mysql-exporter/custom_values.yaml prometheus-mysql-exporter -n production --create-namespace
echo -e "${GREEN} Chart mysql-exporter in namespace production installed.${NORMAL}"
helm install mysql-exporter -f prometheus-mysql-exporter/custom_values.yaml prometheus-mysql-exporter -n staging --create-namespace
echo -e "${GREEN} Chart mysql-exporter in namespace staging installed.${NORMAL}"