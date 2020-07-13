### VisualOffice - Практики и инструменты DevOps

## Screencast

https://www.youtube.com/watch?v=WajkV-tcnCE

## Инструменты и компоненты
| Инструмент/Компонент | Описание |
| ------ | ------ |
| Terraform | [terraform/README.md](https://github.com/bambarambambum/VisualOffice/tree/master/terraform) |
| Helm Charts | [kubernetes/README.md](https://github.com/bambarambambum/VisualOffice/blob/master/kubernetes) |
| Prometheus | [kubernetes/charts_templates/prometheus/README.md](https://github.com/bambarambambum/VisualOffice/blob/master/kubernetes/charts_templates/prometheus) |
| Prometheus Mysql Exporter | [kubernetes/charts_templates/prometheus/README.md](https://github.com/bambarambambum/VisualOffice/blob/master/kubernetes/charts_templates/prometheus) |
| Grafana | [kubernetes/charts_templates/prometheus/README.md](https://github.com/bambarambambum/VisualOffice/blob/master/kubernetes/charts_templates/prometheus) |
| Gitlab CI/CD | [gitlab_ci/README.md](https://github.com/bambarambambum/VisualOffice/blob/master/gitlab_ci) |
| Docker | [docker/README.md](https://github.com/bambarambambum/VisualOffice/blob/master/docker) |
| Приложение VisualOffice | https://github.com/bambarambambum/VisualOffice-App |
## Подготовка
Клонируем репозиторий
```sh
$ git clone https://github.com/bambarambambum/VisualOffice
```
Необходимо отредактировать следующие файлы, указав свои данные:
Далее будут приводиться только те значения, которые обязательны к изменению.
### visualoffice/scripts/environment.sh
| Значение | Описание |
| ------ | ------ |
| GIT_EMAIL | Адрес электронной почты для Git |
| GIT_USER | Имя пользователя для Git |
| PROJECT_ID | Google Cloud Project ID |
| USER_NAME | Имя пользователя Docker Hub |
### visualoffice/terraform/terraform.tfvars (переименуйте terraform.tfvars.example)
| Значение | Описание |
| ------ | ------ |
| project_id | Google Cloud Project ID |
### visualoffice/kubernetes/charts/usersapi/values.yaml
| Значение | Описание |
| ------ | ------ |
| image: | |
| repository: | имя_пользователя_Docker/usersapi |
### visualoffice/kubernetes/charts/webappsite/values.yaml
| Значение | Описание |
| ------ | ------ |
| image: | |
| repository: | имя_пользователя_Docker/webappsite |
### visualoffice/kubernetes/charts/mysql/values.yaml
| Значение | Описание |
| ------ | ------ |
| image: | |
| repository: | имя_пользователя_Docker/webappsite |
## Запуск
1) Подготавливаем окружение
```sh
$ make before_run
```
* Вводим все учетные данные и пароли, которые будут затребованы.
* После выполнения make before_run, переподключиться или сделать ребут.
* Так же нужно авторизоваться в Docker Hub ```docker login```
* Теперь вводим команды:
```sh
cd VisualOffice
source ./scripts/environment.sh
```
2) Запускаем проект
```sh
$ make run
```
3) Теперь необходимо получить внешний IP адрес Ingress контроллера
```sh
$ kubectl get svc nginx-nginx-ingress-controller
```
```
NAME                             TYPE           CLUSTER-IP    EXTERNAL-IP      PORT(S)                      AGE
nginx-nginx-ingress-controller   LoadBalancer   10.3.250.62   35.205.174.124   80:30504/TCP,443:31256/TCP   3m40s
```
4) Добавляем запись в hosts системы (в данном случае Windows)
```
35.205.174.124 visualoffice prometheus grafana gitlab-gitlab staging production
```
И в hosts системы (etc/hosts) с которой запускается проект.
```
35.205.174.124 gitlab-gitlab
```
5) Теперь нужно получить имя pod'a, в котором находится база данных MySQL
```sh
$ kubectl get pod
```
```
visualoffice-mysql-5777748595-qqvvm                         1/1     Running            0          9m38
```
6) И выполнить команду импорта дампа базы
```sh
$ kubectl exec -it visualoffice-mysql-5777748595-qqvvm -- bash -c "mysql -uvisualoffice -pVeryStrongPassword visualoffice < /home/visualoffice.sql"
```
## Проверка
Переходим по адресам
* http://visualoffice/
* http://prometheus/
* https://gitlab-gitlab/
* http://grafana/
* Логин: admin
* Пароль: admin
* Необходимо добавить дашбоард с ID 12206

## (ВРЕМЕННО) Подготовка Gitlab
1) Необходимо авторизоваться в https://gitlab-gitlab/
2) Создать группу с вашим именем пользователя Docker Hub
3) Прописать 2 переменные в группе
```
CI_REGISTRY_USER - логин в Docker Hub
CI_REGISTRY_PASSWORD - пароль от Docker Hub
```
3) Создать внутри группы 2 проекта, один с именем visualoffice, второй с именем visualoffice-deploy
4) В папке gitlab_ci/visualoffice сделать
```sh
$ git init
$ git remote add origin http://gitlab-gitlab/имя_пользователя_docker_hub/visualoffice.git
$ git checkout -b feature/test
$ git add .
$ git commit -m "Test CI"
$ git push origin feature/test
```
5) В папке gitlab_ci/visualoffice-deploy сделать
```sh
$ git init
$ git remote add origin http://gitlab-gitlab/имя_пользователя_docker_hub/visualoffice-deploy.git
$ git add .
$ git commit -m "Test CD"
$ git push origin master
```
5) Теперь можно проверять pipeline'ы
