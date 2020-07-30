#!/bin/bash
set -e
echo -e "${GREEN}Начинаем развертывать Helm Chart'ы помощью Terraform...${NORMAL}"
cd terraform/helm
terraform init
terraform apply -auto-approve
echo -e "${GREEN}Helm Chart'ы были успешно развернуты с помощью Terraform!${NORMAL}"