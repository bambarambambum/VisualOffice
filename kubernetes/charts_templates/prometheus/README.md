# Prometheus
С помощью Prometheus мониторится вся инфраструктура.
Установка Prometheus происходит с помощью ```helm fetch``` в папке charts/, после этого в папку Prometheus переносится файл custom_values.yaml и Prometheus запускается с ключом -f custom_values.yaml

## Переопределенные переменные
### custom_values.yaml
| Ключ | Значение | Описание |
| ------ | ------ | ----- |
| rbac: |  |  |
| create: | true | Role-based access control |
| alertmanager: | | |
| enabled: | true | Включить alertmanager |
| nodeExporter: | | |
| enabled: | true | Включить node-exporter |
| kubeStateMetrics: | | |
| enabled: | true | Включить kubeStateMectics |
| Server: | | |
| ingress: | | |
| enabled: | true | Включить ingress для Prometheus |
| annotations: | | |
| kubernetes.io/ingress.class: | nginx | Тип ingress |
| cert-manager.io/cluster-issuer: | letsencrypt-staging | Выпуск fake-сертификатов (или letsencrypt-production для выпуска настоящих сертификатов) |
| hosts: | prometheus.domain.local | Имя хоста |
## Алерты
Добавлены следующие алерты:
* Группа Prometheus
* - PrometheusJobMissing - Если какой-либо компонент Prometheus недоступен.
* - PrometheusTooManyRestarts - Если какой-либо компонент Prometheus часто перезапускается.
* Группа hostname
* - HostHighCpuLoad - Если загрузка процессора ноды больше 80%
* - HostOutOfMemory - Если памяти на ноде осталось меньше 10%
* - HostUnusualDiskReadLatency - Если задержка на чтения с диска больше 100 мс.
* - HostUnusualDiskWriteLatency - Если задержка на запись на диск больше 100 мс.
* - HostOutOfDiskSpace - Если на диске осталось меньше 10% свободного места.
* - HostDiskWillFillIn4Hours - Когда диск будет заполнен менее, чем через 4 часа при текущей скорости записи на диск.
* Группа kubernetes
* - KubernetesNodeReady - Если нода не готова к работе длительное время.
* - KubernetesJobFailed - Если какая-либо задача провалилась.
* - KubernetesMemoryPressure - Memory Pressure возникает, если кому-то нужна память.
* - KubernetesPersistentvolumeError - Если есть какие-либо проблемы с PV.
* - KubernetesPersistentvolumeclaimPending - Если какое-либо PVC висит в статусе Pending.
* Группа nginx
* - NginxHighHttp4xxErrorRate - Если более 5% запросов возвращают статус 4xx
* - NginxHighHttp5xxErrorRate - Если более 5% запросов возвращают статус 5хх
Правила взяты отсюда: https://awesome-prometheus-alerts.grep.to/
## Конфигурация Targets Prometheus
Добавлены следующие Targets'ы
* job_name: 'webappsite-endpoints' - Группа метрик сервиса webappsite.
* job_name: 'userspapi-endpoints' - Группа метрик сервиса usersapi.
* job_name: 'mysql-exporter-endpoints' - Группа метрик MySQL, получаемых с помощью mysql-exporter.
* job_name: 'visualoffice-application' - Группа метрик сервисов приложения VisualOffice
* job_name: 'visualoffice-production' - Группа метрик сервисов приложения VisualOffice в namespace'e production
* job_name: 'visualoffice-staging' - Группа метрик сервисов приложения VisualOffice в namespace'e staging
## Конфигурация alertmanager для оповещений в Slack
Для работы оповещений, необходимо внести следующие данные в custom_values.yaml:
```
...
alertmanagerFiles:
  alertmanager.yml:
    global:
      slack_api_url: "enter_slack_api"

    receivers:
      - name: default-receiver
        slack_configs:
        - channel: '#your-channel'
      send_resolved: true
...
```

### Запускаем
Prometheus запускается вместе с остальными Helm Chart'ами. Однако, если нужно запустить Prometheus отдельно:
Из папки с Chart'ами (kubernetes/charts):
```sh
$ helm install prometheus -f prometheus/custom_values.yaml prometheus -n monitoring
```
Обновить Chart Prometheus:
```sh
$ helm upgrade prometheus -f prometheus/custom_values.yaml prometheus -n monitoring
```
Удалить Chart Prometheus:
```sh
$ helm delete prometheus
```
