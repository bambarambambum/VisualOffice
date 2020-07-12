#!/bin/bash
set -e
terraform init
terraform apply -auto-approve
gcloud container clusters get-credentials ${PROJECT_ID}-gke --zone ${ZONE} --project ${PROJECT_ID}
echo -e "${GREEN}The cluster was successfully deloyed by Terraform.${NORMAL}"