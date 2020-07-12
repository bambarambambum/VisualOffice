before_run:
	cd scripts && \
    source environment.sh && \
	./prepare.sh

run: docker terraform helm

destroy: no_terraform

terraform:
	cd terraform && \
	./run.sh

no_terraform:
	cd terraform && \
	./destroy.sh

docker:
	cd scripts && \
	./docker.sh

## Helm
deb_helm:
	cd kubernetes/charts && \
	helm dep update visualoffice && \
	echo "${GREEN}Helm dependencies updated.${NORMAL}"

helm:
	cd scripts && \
	./helm.sh

### Debug
#upgrade_prometheus:
#	cd kubernetes/charts && \
#	helm upgrade ${PROM_NAME} -f prometheus/custom_values.yaml prometheus && \
#	echo "${GREEN}Chart ${PROM_NAME} upgraded.${NORMAL}"

#restore_db:
#	POD=kubectl get pod -o=jsonpath='{.items..metadata.name}' | awk '{print $1}' | grep mysql && \
#	kubectl exec -it ${POD} -- bash -c "mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < /home/visualoffice.sql"
