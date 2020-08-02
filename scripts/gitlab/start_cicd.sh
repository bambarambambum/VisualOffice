#!/bin/bash
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_USER}"
echo -e "${GREEN}Добавляем репозиторий visualoffice в Gitlab...${NORMAL}"
cd gitlab_ci/visualoffice
git remote remove origin
git init
git remote add origin https://gitlab.$DNS_DOMAIN_NAME/$USER_NAME/visualoffice.git
git checkout -b feature/test
git add .
git commit -m "Test CI"
git push origin feature/test
echo -e "${GREEN}Репозиторий visualoffice добавлен в Gitlab, можно проверять pipeline'ы${NORMAL}"
echo -e "${GREEN}Добавляем репозиторий visualoffice-deploy в Gitlab...${NORMAL}"
cd ../visualoffice-deploy
git remote remove origin
git init
git remote add origin https://gitlab.$DNS_DOMAIN_NAME/$USER_NAME/visualoffice-deploy.git
git add .
git commit -m "Test CD"
git push origin master
echo -e "${GREEN}Репозиторий visualoffice-deploy добавлен в Gitlab, можно проверять pipeline'ы${NORMAL}"