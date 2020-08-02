#!/bin/bash
set -e

echo -e "${GREEN}Начата замена всех ingress блоков для выпуска настоящих сертификатов.${NORMAL}"
sed -i "s/letsencrypt-staging/letsencrypt-production/g" kubernetes/charts/grafana/custom_values.yaml
sed -i "s/letsencrypt-staging/letsencrypt-production/g" kubernetes/charts/prometheus/custom_values.yaml
sed -i "s/letsencrypt-staging/letsencrypt-production/g" kubernetes/charts/visualoffice/values.yaml
echo -e "${GREEN}Замена завершена!${NORMAL}"
echo -e "${GREEN}Обновляем Helm Chart'ы...${NORMAL}"
cd kubernetes/charts
helm upgrade "$APP_NAME" visualoffice/ -n application
helm upgrade "$PROM_NAME" -f prometheus/custom_values.yaml prometheus/ -n monitoring
helm upgrade "$GRAFANA_NAME" -f grafana/custom_values.yaml grafana/ -n monitoring
echo -e "${GREEN}Helm Chart'ы обновлены!${NORMAL}"