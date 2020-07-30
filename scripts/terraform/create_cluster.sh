#!/bin/bash
set -e
echo -e "${GREEN}Начинаем развертывать кластер с помощью Terraform...${NORMAL}"
cd terraform/kubernetes
terraform init
terraform apply -auto-approve
gcloud container clusters get-credentials ${PROJECT_ID}-gke --zone ${ZONE} --project ${PROJECT_ID}
echo -e "${GREEN}Развертывание кластера с помощью Terraform завершено!${NORMAL}"