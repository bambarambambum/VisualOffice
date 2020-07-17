#!/bin/bash
set -e
gcloud dns record-sets transaction start --zone=$DNS_ZONE_NAME
gcloud dns record-sets transaction add "$(kubectl get ingress gitlab-webservice --output jsonpath='{.status.loadBalancer.ingress[0].ip}')" --name=registry.$DNS_DOMAIN_NAME --ttl=300 --type=A --zone=$DNS_ZONE_NAME
gcloud dns record-sets transaction add "$(kubectl get ingress gitlab-webservice --output jsonpath='{.status.loadBalancer.ingress[0].ip}')" --name=gitlab.$DNS_DOMAIN_NAME --ttl=300 --type=A --zone=$DNS_ZONE_NAME
gcloud dns record-sets transaction add "$(kubectl get service nginx-nginx-ingress-controller --output jsonpath='{.status.loadBalancer.ingress[0].ip}')" --name=visualoffice.$DNS_DOMAIN_NAME --ttl=300 --type=A --zone=$DNS_ZONE_NAME
gcloud dns record-sets transaction add "$(kubectl get service nginx-nginx-ingress-controller --output jsonpath='{.status.loadBalancer.ingress[0].ip}')" --name=webappsite.$DNS_DOMAIN_NAME --ttl=300 --type=A --zone=$DNS_ZONE_NAME
gcloud dns record-sets transaction add "$(kubectl get service nginx-nginx-ingress-controller --output jsonpath='{.status.loadBalancer.ingress[0].ip}')" --name=usersapi.$DNS_DOMAIN_NAME --ttl=300 --type=A --zone=$DNS_ZONE_NAME
gcloud dns record-sets transaction add "$(kubectl get service nginx-nginx-ingress-controller --output jsonpath='{.status.loadBalancer.ingress[0].ip}')" --name=staging.$DNS_DOMAIN_NAME --ttl=300 --type=A --zone=$DNS_ZONE_NAME
gcloud dns record-sets transaction add "$(kubectl get service nginx-nginx-ingress-controller --output jsonpath='{.status.loadBalancer.ingress[0].ip}')" --name=production.$DNS_DOMAIN_NAME --ttl=300 --type=A --zone=$DNS_ZONE_NAME
gcloud dns record-sets transaction execute --zone $DNS_ZONE_NAME