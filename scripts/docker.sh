#!/bin/bash
set -e
cd ../gitlab_ci/visualoffice/src/WebAppSite
docker build -t ${USER_NAME}/webappsite -f Dockerfile.linux .
echo -e "${GREEN}Build image ${APP_NAME}/webappsite completed.${NORMAL}"
docker push ${USER_NAME}/webappsite
echo -e "${GREEN}Push image ${APP_NAME}/webappsite completed.${NORMAL}"
cd ../Users
docker build -t ${USER_NAME}/usersapi -f Dockerfile.linux .
echo -e "${GREEN}Build image ${APP_NAME}/usersapi completed.${NORMAL}"
docker push ${USER_NAME}/usersapi
echo -e "${GREEN}Push image ${APP_NAME}/usersapi completed.${NORMAL}"
cd ../../../../docker/mysql
docker build -t ${USER_NAME}/mysql .
echo -e "${GREEN}Build image ${APP_NAME}/mysql completed.${NORMAL}"	
docker push ${USER_NAME}/mysql
echo -e "${GREEN}Push image ${APP_NAME}/mysql completed.${NORMAL}"