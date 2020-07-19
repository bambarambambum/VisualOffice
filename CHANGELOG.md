# VisualOffice changelog

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
