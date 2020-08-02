#!/bin/bash
set -e

# Webappsite
echo -e "${GREEN}Начата сборка образа ${APP_NAME}/webappsite...${NORMAL}"
cd gitlab_ci/visualoffice/src/WebAppSite
docker build -t "$USER_NAME"/webappsite -f Dockerfile.linux .
echo -e "${GREEN}Сборка образа ${APP_NAME}/webappsite завершена.${NORMAL}"
echo -e "${GREEN}Начата публикация образа ${APP_NAME}/webappsite...${NORMAL}"
docker push "$USER_NAME"/webappsite
echo -e "${GREEN}Публикация образа ${APP_NAME}/webappsite завершена.${NORMAL}"

# Usersapi
echo -e "${GREEN}Начата сборка образа ${APP_NAME}/usersapi...${NORMAL}"
cd ../Users
docker build -t "$USER_NAME"/usersapi -f Dockerfile.linux .
echo -e "${GREEN}Сборка образа ${APP_NAME}/usersapi завершена.${NORMAL}"
echo -e "${GREEN}Начата публикация образа ${APP_NAME}/usersapi...${NORMAL}"
docker push "$USER_NAME"/usersapi
echo -e "${GREEN}Публикация образа ${APP_NAME}/usersapi завершена.${NORMAL}"

# Mysql
echo -e "${GREEN}Начата сборка образа ${APP_NAME}/mysql...${NORMAL}"
cd ../../../../docker/mysql	
docker build -t "$USER_NAME"/mysql .
echo -e "${GREEN}Сборка образа ${APP_NAME}/mysql завершена.${NORMAL}"
echo -e "${GREEN}Начата публикация образа ${APP_NAME}/mysql...${NORMAL}"
docker push "$USER_NAME"/mysql
echo -e "${GREEN}Публикация образа ${APP_NAME}/mysql завершена.${NORMAL}"
