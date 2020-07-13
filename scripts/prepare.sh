#!/bin/bash
#
set -e
echo -e "${GREEN}Начинается установка зависимостей и приложений...${NORMAL}"
echo -e "${GREEN}В случае необходимости, вводите данные которые будут запрошены.${NORMAL}"
sleep 2
echo -e "${GREEN}Обновляем систему...${NORMAL}"
sudo apt update && sudo apt upgrade -y
sudo apt install curl -y
sudo apt install unzip -y
echo -e "${GREEN}Устанавливаем Docker...${NORMAL}"
sudo apt install docker.io -y
sudo gpasswd -a $USER docker
echo -e "${GREEN}Устанавливаем Google Cloud SDK...${NORMAL}"
echo -e "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt update && sudo apt install google-cloud-sdk -y
echo -e "${GREEN}Устанавливаем Kubectl...${NORMAL}"
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
echo -e "${GREEN}Устанавливаем Helm...${NORMAL}"
curl -O "https://get.helm.sh/helm-v3.2.4-linux-amd64.tar.gz"
tar -xzf helm-v3.2.4-linux-amd64.tar.gz -C . linux-amd64/helm
sudo mv linux-amd64/helm /usr/local/bin/helm
rm -r linux-amd64
rm helm-v3.2.4-linux-amd64.tar.gz
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
echo -e "${GREEN}Устанавливаем Terraform...${NORMAL}"
curl -O https://releases.hashicorp.com/terraform/0.12.28/terraform_0.12.28_linux_amd64.zip
unzip terraform_0.12.28_linux_amd64.zip
rm terraform_0.12.28_linux_amd64.zip
sudo mv terraform /usr/local/bin/terraform
helm repo add gitlab https://charts.gitlab.io
# Производим авторизацию и конфигурацию там, где это нужно
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_USER}"
echo -e "${GREEN}Авторизуемся в gcloud...${NORMAL}"
gcloud init --console-only
echo -e "${GREEN}Авторизуем приложения в gcloud...${NORMAL}"
gcloud auth application-default login
echo -e "${GREEN}Клонируем проект...${NORMAL}"
cd ..
git clone https://github.com/bambarambambum/VisualOffice-App
cp -R VisualOffice-App gitlab_ci/visualoffice
echo -e "${GREEN}Подготавливаем файлы для Gitlab CI...${NORMAL}"
mkdir gitlab_ci/visualoffice-deploy
cp -R kubernetes/charts/mysql gitlab_ci/visualoffice-deploy/mysql
cp -R kubernetes/charts/usersapi gitlab_ci/visualoffice-deploy/usersapi
cp -R kubernetes/charts/webappsite gitlab_ci/visualoffice-deploy/webappsite
cp -R kubernetes/charts/visualoffice gitlab_ci/visualoffice-deploy/visualoffice
cp kubernetes/charts/.gitlab-ci.yml gitlab_ci/visualoffice-deploy/.gitlab-ci.yml
rm -Rf VisualOffice-App