#!/bin/bash
set -e
echo -e "${GREEN}Восстанавливаем дамп базы VisualOffice...${NORMAL}"
POD_NAME=$(kubectl get pods -l "app=visualoffice, component=mysql" -o jsonpath="{.items[0].metadata.name}" -n application)
kubectl exec -it "$POD_NAME" -n application -- bash -c "mysql -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /home/visualoffice.sql"
echo -e "${GREEN}Дамп базы VisualOffice восстановлен!${NORMAL}"