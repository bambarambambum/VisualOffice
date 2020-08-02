#!/bin/bash
#
set -e
echo -e "${GREEN}Начинается установка зависимостей и приложений...${NORMAL}"
sleep 2
echo -e "${GREEN}Обновляем систему...${NORMAL}"
sudo apt update && sudo apt upgrade -y
sudo apt install curl unzip -y
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
echo -e "${GREEN}Устанавливаем Terraform...${NORMAL}"
curl -O https://releases.hashicorp.com/terraform/0.12.28/terraform_0.12.28_linux_amd64.zip
sudo unzip terraform_0.12.28_linux_amd64.zip -d /usr/local/bin/
rm terraform_0.12.28_linux_amd64.zip
sudo service docker restart