#!/bin/bash
set -e
# Copy templates custom_values.yaml
echo -e "${GREEN}Копирование шаблонов начато...${NORMAL}"

# Services
## Grafana
cp kubernetes/charts_templates/grafana/custom_values.yaml kubernetes/charts/grafana/custom_values.yaml
cp -R kubernetes/charts_templates/grafana/dashboards kubernetes/charts/grafana/dashboards
## Gitlab
cp kubernetes/charts_templates/gitlab/custom_values.yaml kubernetes/charts/gitlab/custom_values.yaml
## Prometheus
cp kubernetes/charts_templates/prometheus/custom_values.yaml kubernetes/charts/prometheus/custom_values.yaml
## Prometheus-Mysql-Exporter
cp kubernetes/charts_templates/prometheus-mysql-exporter/custom_values.yaml kubernetes/charts/prometheus-mysql-exporter/custom_values.yaml

# Application
## Mysql
cp kubernetes/charts_templates/mysql/values.yaml kubernetes/charts/mysql/values.yaml
cp kubernetes/charts_templates/mysql/templates/secret.yaml.example kubernetes/charts/mysql/templates/secret.yaml
## Usersapi
cp kubernetes/charts_templates/usersapi/values.yaml kubernetes/charts/usersapi/values.yaml
cp kubernetes/charts_templates/usersapi/templates/secret.yaml.example kubernetes/charts/usersapi/templates/secret.yaml
## Webappsite
cp kubernetes/charts_templates/webappsite/values.yaml kubernetes/charts/webappsite/values.yaml
echo -e "${GREEN}Копирование шаблонов завершено!${NORMAL}"

# Replace values
echo -e "${GREEN}Замена предустановленных значений начата...${NORMAL}"

# Services
## Grafana
sed -i "s/replace_hosts/$GRAFANA_NAME.$DNS_DOMAIN_NAME/g" kubernetes/charts/grafana/custom_values.yaml
## Prometheus
sed -i "s/replace_hosts/$PROM_NAME.$DNS_DOMAIN_NAME/g" kubernetes/charts/prometheus/custom_values.yaml
## Gitlab
sed -i "s/replace_domain/$DNS_DOMAIN_NAME/g" kubernetes/charts/gitlab/custom_values.yaml
sed -i "s/replace_email/$GIT_EMAIL/g" kubernetes/charts/gitlab/custom_values.yaml
## Prometheus-Mysql-Exporter
sed -i "s/replace_password/$MYSQL_PASSWORD/g" kubernetes/charts/prometheus-mysql-exporter/custom_values.yaml
sed -i "s/replace_user/$MYSQL_USER/g" kubernetes/charts/prometheus-mysql-exporter/custom_values.yaml

# Application 
## Mysql
sed -i "s/replace_dockerhub_username/$USER_NAME/g" kubernetes/charts/mysql/values.yaml
sed -i "s/replace_root_password/$MYSQL_ROOT_PASSWORD/g" kubernetes/charts/mysql/templates/secret.yaml
sed -i "s/replace_database/$MYSQL_DATABASE/g" kubernetes/charts/mysql/templates/secret.yaml
sed -i "s/replace_mysql_user/$MYSQL_USER/g" kubernetes/charts/mysql/templates/secret.yaml
sed -i "s/replace_mysqluser_password/$MYSQL_PASSWORD/g" kubernetes/charts/mysql/templates/secret.yaml
## Usersapi
sed -i "s/replace_dockerhub_username/$USER_NAME/g" kubernetes/charts/usersapi/values.yaml
sed -i "s/replace_mysql_user/$MYSQL_USER/g" kubernetes/charts/usersapi/templates/secret.yaml
sed -i "s/replace_mysqluser_password/$MYSQL_PASSWORD/g" kubernetes/charts/usersapi/templates/secret.yaml
sed -i "s/replace_database/$MYSQL_DATABASE/g" kubernetes/charts/usersapi/templates/secret.yaml
## Webappsite
sed -i "s/replace_dockerhub_username/$USER_NAME/g" kubernetes/charts/webappsite/values.yaml
sed -i "s/replace_hosts/$APP_NAME.$DNS_DOMAIN_NAME/g" kubernetes/charts/webappsite/values.yaml

echo -e "${GREEN}Замена предустановленных значений завершена!${NORMAL}"
