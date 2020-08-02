#!/bin/bash
set -e

sleep 10
GITLAB_INGRESS_IP=$(kubectl get ingress -n application gitlab-webservice --output jsonpath='{.status.loadBalancer.ingress[0].ip}')
APP_INGRESS_IP=$(kubectl get service nginx-ingress-controller --output jsonpath='{.status.loadBalancer.ingress[0].ip}')

echo -e "${GREEN}Создаем DNS А записи...${NORMAL}"
gcloud dns record-sets transaction start --zone="$DNS_ZONE_NAME"
gcloud dns record-sets transaction add "$GITLAB_INGRESS_IP" --name=registry."$DNS_DOMAIN_NAME" --ttl=300 --type=A --zone="$DNS_ZONE_NAME"
gcloud dns record-sets transaction add "$GITLAB_INGRESS_IP" --name=gitlab."$DNS_DOMAIN_NAME" --ttl=300 --type=A --zone="$DNS_ZONE_NAME"
gcloud dns record-sets transaction add "$APP_INGRESS_IP" --name=visualoffice."$DNS_DOMAIN_NAME" --ttl=300 --type=A --zone="$DNS_ZONE_NAME"
gcloud dns record-sets transaction add "$APP_INGRESS_IP" --name=webappsite."$DNS_DOMAIN_NAME" --ttl=300 --type=A --zone="$DNS_ZONE_NAME"
gcloud dns record-sets transaction add "$APP_INGRESS_IP" --name=usersapi."$DNS_DOMAIN_NAME" --ttl=300 --type=A --zone="$DNS_ZONE_NAME"
gcloud dns record-sets transaction add "$APP_INGRESS_IP" --name=staging."$DNS_DOMAIN_NAME" --ttl=300 --type=A --zone="$DNS_ZONE_NAME"
gcloud dns record-sets transaction add "$APP_INGRESS_IP" --name=production."$DNS_DOMAIN_NAME" --ttl=300 --type=A --zone="$DNS_ZONE_NAME"
gcloud dns record-sets transaction add "$APP_INGRESS_IP" --name=grafana."$DNS_DOMAIN_NAME" --ttl=300 --type=A --zone="$DNS_ZONE_NAME"
gcloud dns record-sets transaction add "$APP_INGRESS_IP" --name=prometheus."$DNS_DOMAIN_NAME" --ttl=300 --type=A --zone="$DNS_ZONE_NAME"
gcloud dns record-sets transaction execute --zone "$DNS_ZONE_NAME"
echo -e "${GREEN}Создание DNS A записей завершенно!${NORMAL}"