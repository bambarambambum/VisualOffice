# Prometheus
С помощью Prometheus мониторится вся инфраструктура.
Установка Prometheus происходит с помощью ```helm fetch``` в папке charts/, после этого в папку Prometheus переносится файл custom_values.yaml и Prometheus запускается с ключом -f custom_values.yaml

## Переопределенные переменные
### custom_values.yaml
| Ключ | Значение | Описание |
| ------ | ------ | ----- |
| rbac: |  |  |
| create: | false | Не использовать Role-based access control |
| alertmanager: | | |
| enabled: | true | Включить alertmanager |
| nodeExporter: | | |
| enabled: | true | Включить node-exporter |
| kubeStateMetrics: | | |
| enabled: | true | Включить kubeStateMectics |
| Server: | | |
| ingress: | | |
| enabled: | true | Включить ingress для Prometheus |
| hosts: | prometheus | Имя хоста |
## Алерты
Настроен простой алертинг
```
- alert: NodeDown
  expr: up == 0
  for: 1m
  labels:
    severity: critical
  annotations:
    summary: "Node down"
    description: "Node has been down for more than 1 minute."
```
## Конфигурация Targets Prometheus
Добавлены следующие Targets'ы
* job_name: 'webappsite-endpoints' - Группа метрик сервиса webappsite.
* job_name: 'userspapi-endpoints' - Группа метрик сервиса usersapi.
* job_name: 'mysql-exporter-endpoints' - Группа метрик MySQL, получаемых с помощью mysql-exporter.
* job_name: 'visualoffice-default' - Группа метрик сервисов приложения VisualOffice
* job_name: 'visualoffice-production' - Группа метрик сервисов приложения VisualOffice в namespace'e production
* job_name: 'visualoffice-staging' - Группа метрик сервисов приложения VisualOffice в namespace'e staging

### Запускаем
* Убедитесь, что установлен helm3, kubectl

Можно вспользоваться командной ```make helm``` из корня репозитория, это запустит все существующие Chart'ы, включая Promtheus, или:
Из папки с Chart'ами (kubernetes/charts):
```sh
$ helm install prometheus -f prometheus/custom_values.yaml prometheus
```
Обновить Chart Prometheus:
```sh
$ helm upgrade prometheus -f prometheus/custom_values.yaml prometheus
```
Удалить Chart Prometheus:
```sh
$ helm delete prometheus
```
