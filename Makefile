.PHONY: docker terraform

run: helm gitlab docker terraform restore_dump dns cluster-issuer-staging gitlab_rbac

destroy: no_terraform

# Env
before_run: before_run_prepare before_run_auth

before_run_prepare:
	./scripts/env/prepare.sh
before_run_auth:
	./scripts/env/authorizate.sh

# Terraform
terraform: terraform_prepare_vars terraform_deploy terraform_helm

terraform_prepare_vars:
	./scripts/terraform/prepare_vars.sh
terraform_deploy:
	./scripts/terraform/create_cluster.sh
terraform_helm:
	./scripts/terraform/deploy_helm.sh

no_terraform:
	./scripts/terraform/destroy.sh

# Docker
docker:
	./scripts/docker/docker.sh

# Helm
helm: helm_fetch_charts helm_prepare_charts

helm_fetch_charts:
	./scripts/charts/fetch_charts.sh
helm_prepare_charts:
	./scripts/charts/prepare_charts_template.sh

# Mysql
restore_dump:
	./scripts/env/dump.sh

# Gitlab
gitlab:
	./scripts/gitlab/prepare_gitlab_ci.sh
gitlab_prepare_repo:
	./scripts/gitlab/start_cicd.sh
gitlab_rbac:
	kubectl create clusterrolebinding gitlab-cluster-admin --clusterrole=cluster-admin --group=system:serviceaccounts

# DNS
dns: create_dns_zone create_dns_a_records

create_dns_zone:
	./scripts/dns/create_dns_zone.sh
create_dns_a_records:
	./scripts/dns/create_dns_zone_records.sh

# Cert-manager
cluster-issuer-staging:
	kubectl apply -f kubernetes/cluster-Issuer-staging.yml

#cluster-issuer-production:
#	kubectl apply -f kubernetes/cluster-Issuer-production.yml && \
#	./scripts/charts/cert-manager_production.sh