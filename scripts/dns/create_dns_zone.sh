#!/bin/bash
echo -e "${GREEN}Создаем зону DNS...${NORMAL}"
gcloud dns managed-zones create "$DNS_ZONE_NAME" --dns-name "$DNS_DOMAIN_NAME" --description "My zone for project"
echo -e "${GREEN}Создание зоны DNS завершено!${NORMAL}"