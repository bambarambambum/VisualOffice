#!/bin/bash
set -e
echo -e "${GREEN}Начинаем уничтожение кластера с помощью Terraform...${NORMAL}"
cd terraform/kubernetes
terraform destroy -auto-approve
echo -e "${GREEN}Кластер был уничтожен с помощью Terraform...${NORMAL}"