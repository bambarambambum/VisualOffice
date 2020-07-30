#!/bin/bash
set -e
echo -e "${GREEN}Подготавливаем файлы для Gitlab CI...${NORMAL}"
git clone https://github.com/bambarambambum/VisualOffice-App
cp -R VisualOffice-App gitlab_ci/visualoffice
mkdir gitlab_ci/visualoffice-deploy
cp -R kubernetes/charts/mysql gitlab_ci/visualoffice-deploy/mysql
cp -R kubernetes/charts/usersapi gitlab_ci/visualoffice-deploy/usersapi
cp -R kubernetes/charts/webappsite gitlab_ci/visualoffice-deploy/webappsite
cp -R kubernetes/charts/visualoffice gitlab_ci/visualoffice-deploy/visualoffice
cp kubernetes/charts/.gitlab-ci.yml gitlab_ci/visualoffice-deploy/.gitlab-ci.yml
rm -Rf VisualOffice-App
echo -e "${GREEN}Подготавление файлов для Gitlab CI завершено!${NORMAL}"