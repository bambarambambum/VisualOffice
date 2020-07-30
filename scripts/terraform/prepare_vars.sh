#!/bin/bash
set -e

echo -e "${GREEN}Подготавливаем tfvars для Terraform...${NORMAL}"
cp terraform/kubernetes/terraform.tfvars.example terraform/kubernetes/terraform.tfvars
sed -i "s/replace_my_project/$PROJECT_ID/g" terraform/kubernetes/terraform.tfvars
echo -e "${GREEN}Подготавливаем tfvars для Terraform завершена!${NORMAL}"