# Grafana
Grafana используется для визуализации метрик с мониторинга Prometheus.  
При запуске Grafana сразу же импортируются дашбоарды и datasource Prometheus
Учетные данные при первичном входе:  
Логин: admin
Пароль: admin  
## Описание настроек Helm Chart'a Grafana - custom_values.yaml
| Имя | Описание | Значение |
| ------ | ------ | ----- |
| ingress: | - | - |
| enabled: | true | Активировать ingress |
| annotations: | | |
| kubernetes.io/ingress.class: | nginx | Тип ingress |
| cert-manager.io/cluster-issuer: | letsencrypt-staging | Выпуск fake-сертификатов (или letsencrypt-production для выпуска настоящих сертификатов) |
| hosts: | grafana.visualoffice.tk | Имя хоста |
||||
| adminUser: | admin | Имя пользователя Grafana |
| adminPassword: | admin | Пароль пользователя Grafana |
||||
| datasources: | | Источник метрик (Prometheus) |
||||
| dashboards: | | Список дашбоардов |

## Дашбоарды и их описание
| Название источника | Название дашбоарда | Описание | Ссылка |
| ------ | ------ | ----- | ----- |
| kubernetes-cluster.json | Kubernetes Ingress Controller Dashboard | Показывает общую загрузку процессора / памяти / файловой системы кластера, а также статистику отдельных модулей, контейнеров и системных служб.Использует только метрики cAdvisor | https://grafana.com/grafana/dashboards/12206 |
| mysql.json | MySQL Overview | Показывает аптайм, кол-во подключений и другие различные счетчики и системную информацию | https://grafana.com/grafana/dashboards/7362  |
| nginx-ingress.json | Kubernetes Ingress Controller Dashboard | Показывает кол-во запросов, успешно обработанных запросов, список всех ingress, загрузку сети, использование памяти и процессора. | https://grafana.com/grafana/dashboards/12575  |
| visualoffce.json | Visualoffice Application | Показывает среднюю загрузку процессора, памяти приложением, а так же среднее время выполнения запроса, кол-во запросов к приложению | -  |

## Конфигурация и запуск
Необходимо убедиться что в **custom_values.yaml** в блоке **ingress:**, указано правильное имя хоста в значении **hosts:**  
```grafana.visualoffice.tk```
Grafana запускается вместе с остальными Helm Chart'ами. Однако, если нужно запустить Grafana отдельно:
```sh
$ helm install grafana -f grafana/custom_values.yaml grafana -n monitoring
```
Обновить:
```sh
$ helm upgrade grafana -f grafana/custom_values.yaml grafana -n monitoring
```
Удалить: 
```sh
$ helm delete grafana -n monitoring
```