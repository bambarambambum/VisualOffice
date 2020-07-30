#!/bin/bash
set -e
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_USER}"
echo -e "${GREEN}Авторизуемся в gcloud...${NORMAL}"
gcloud init --console-only
echo -e "${GREEN}Авторизуем приложения в gcloud...${NORMAL}"
gcloud auth application-default login
echo -e "${GREEN}Авторизуемся в Docker Hub...${NORMAL}"
docker login