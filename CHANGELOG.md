# VisualOffice changelog

### 02.08.2020 - v2.0.2
* Внесены корректировки во все README.md  
* Исправлены ошибки в .travis.yml  

### 02.08.2020 - v2.0.1
* Удалены лишние файлы.

### 02.08.2020 - v2.0.0
* Слияние develop в master

### 02.08.2020 - Develop - v1.1.4
* Добавлены тесты .travis.yml

### 02.08.2020 - Develop - v1.1.3
* Исправлены ошибки в /scripts/env/prepare.sh
* Исправлены ошибки в /scripts/charts/fetch_charts.sh
* Исправлены ошибки в /scripts/docker/docker.sh
* Файл visualoffice/scripts/dns/create_dns_zone.sh отмечен как исполняемый.
* Добавлен скрипт /scripts/gitlab/start_cicd.sh
* Добавлена команда gitlab_prepare_repo в Makefile
* Исправлена ошибка с копированием дашбоардов в /scripts/charts/prepare_charts_template.sh
* Доработан /gitlab_ci/README.md
* Доработан /scripts/README.md
* Доработан README.md

### 30.07.2020 - Develop - v1.1.2
* Стилистические правки, исправление опечаток и форматирования во всех README.md

### 30.07.2020 - Develop - v1.1.1
* Поправлен README.md

### 30.07.2020 - Develop - v1.1.0
* Доработан Terraform (Создание кластера и делой Helm Chart'ов теперь в разных каталогах).
* Шаблонизированы (charts_templates) все необходимые для запуска проекта файлы Helm Chart'ов.  
* Переделаны, доработаны и созданы новые скрипты. Для запуска проекта необходимо меньше ручных действий.
* Добавлен мини-гайд README_DOMAIN.md для получения своего домена.
* Актуализированы все README.md всех компонентов и сервисов.
* Добавлен README.md для scripts.
* Доработан Makefile
* Внесены новые записи в .gitignore

### 25.07.2020 - Develop - v1.0.5
* Добавлены clusterrole и clusterrolebinding для Chart'ов usersapi и mysql
* Приложение VisualOffce и gitlab вынесены в отдельный namespace - application

### 21.07.2020 - Develop - v1.0.4
* Добавлен выпуск fake-сертификатов для visualoffice, grafana, prometheus

### 20.07.2020 - Develop - v1.0.3
* Обновлен charts/README.md
* Добавлены secret'ы в Chart'ы usersapi и mysql
* Убраны лишние значения из values.yaml Chart'ов usersapi и mysql

### 19.07.2020 - Develop - v1.0.2
* Обновлен charts_templates/prometheus/README.md
* Добавлено несколько алертов в Prometheus
* Обновлен charts_templates/grafana/README.md
* Автоматическое добавление дашбоардов при запуске Grafana

### 18.07.2020 - Develop - v1.0.1
* Обновлен gitlab_ci/README.md
* Доработаны пайплайны visualoffice и visualoffice-deploy (добавлен триггер для деплоя)
* Добавлено развертывание Helm Chart'ов с помощью Terraform
* Добавлены Dashboard'ы для Grafana

### 17.07.2020 - Develop - v1.0.0
* Обновлена версия Gitlab до 13.1.3 (для его работы требуется домен в управлении Google DNS, инструкции где взять домен и как настроить будут позднее)
* Переработаны пайплайны visualoffice и visualoffice-deploy (убрано дублирование кода, добавлены условия для этапов)

### 14.07.2020 - v1.0.4
* Добавлена ссылка на Screencast

### 13.07.2020 - v1.0.3
* Поправлен prepare.sh
* Внесены мелкие правки
* Дополнен README.md

### 13.07.2020 - v1.0.2
* Поправлен prepare.sh
* Удалены лишние файлы
* Дополнен README.md

### 13.07.2020 - v1.0.1
* Поправлен Makefile
* Поправлен prepare.sh
* Дополнен README.md

### 12.07.2020 - v1.0
* Добавлен Helm Chart Prometheus
* Добавлен Helm Chart Prometheus MySQL Exporter
* Добавлен Helm Chart Gitlab
* Добавлен Helm Chart Grafana
* Доработаны Helm Chart'ы для приложения VisualOffce
* Настроен Prometheus для мониторинга инфраструктуры и приложения.
* Настроен Grafana и добавлен дашбоард для визуализации метрик кластера Kubernetes
* Настроен конвеер Gitlab CI/CD
* Созданы скрипты для сборки и запуска проекта
* Обновлен Makefile
* Добавлены README.md к комонентам и инструментам
* Обновлен README.md репозитория

### 05.07.2020 - Clean repo
* Убраны лишние файлы из репозитория
### 05.07.2020 - Update README.md
* Обновлен README.md
### 05.07.2020 - Initial commit
* Первичный коммит
* Описаны Helm Chart'ы для запуска приложения
* Описана terraform инфраструктура для создания кластера Kubernetes
