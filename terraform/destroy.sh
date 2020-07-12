#!/bin/bash
terraform destroy -auto-approve
echo -e "${GREEN}The cluster was successfully destroyed by Terraform.${NORMAL}"