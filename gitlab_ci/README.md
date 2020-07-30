# Gitlab CI/CD
C помощью Gitlab реализован конвеер CI/CD.
Используемая версия Gitlab 13.1.3 EE
## Файловая схема
- gitlab_ci
- - visualoffice
- - - src - Исходники приложения
- - - ... - остальные файлы
 - - - .gitlab-ci.yml
- - visualoffice-deploy
- - - mysql - Helm Chart
- - - usersapi - Helm Chart
- - - visualoffice - Helm Chart 
- - - webappsite - Helm Chart
- - - .gitlab-ci.yml
- - README.md

## Описание работы конвеера visualoffice
* При пуше в branch
* - Запускается тест, проверящий Dockerfile.linux линтером.
* - Происходит сборка образов, с тэгом названия ветки (напр. feature-test) если в папке src/Users/* и/или src/WebAppSite/* произошли изменения. Если изменений не было, сборки не происходит. Образы пушатся в Docker Hub.
* - После сборки образа запускается деплой Helm Chart для проверки работоспособности сервисов.
* - После проверки, необходимо запустить вручную очистку, что бы удалить Helm Chart.
* При пуше в master
* - Происходит пуш успешно собраного образа из branch с тэгом latest в Docker Hub.
* - Срабатывает триггер на вызов visualoffice-deploy
## Описание работы конвеера visualoffice-deploy
* Запускается тест, проверящий Helm Chart'ы линтером.
* Происходит сборка Helm Chart'ов приложения в окружение staging
* После проверки staging окружения, можно вручную запустить сборку Helm Chart'ов приложения в окружение production

## Описание конвеера visualoffice
Конвеер поделен на несколько этапов и задач
* test - тестирование (проверка Dockerfile)
* build - сборка образов 
* - build userapi - задача сборки образа usersapi
* - build webappsite - задача сборки образа webappsite
* - build userapi master - задача пуша latest образа usersapi
* - build webappsite master - задача пуша latest образа webappsite
* review - проверка работоспособности образов
* - review usersapi - задача запуска образа usersapi
* - review webappsite - задача запуска образа webappsite
* release - публикация образов (только в ветке мастер)
* - release usersapi - задача публикации образа usersapi
* - release webappsite - задача публикации образа webappsite
* cleanup - удаление запущенных образов
* - cleanup usersapi - задача удаления запущенного образа usersapi
* - cleanup webappsite - задача удаления запущенного образа webappsite
## Описание конвеера visualoffice-deploy
Конвеер поделен на несколько этапов и задач
* test - тестирование (проверка helm charts)
* staging - Сборка приложения в окружении staging
* production - Сборка приложения в окружении production 

## Конфигурация
Необходимо сделать:
* Сменить пароль пользователя root на более удобный (опционально)
* Группу с именем dockerhub
* В группе указать переменные:
* - CI_REGISTRY_USER - логин Docker Hub
* - CI_REGISTRY_PASSWORD - пароль Docker Hub
* - URL - название вашего домена
* 2 проекта с именами:
* - visualoffice
* - visualoffice-deploy
* Создать триггер в проекте visualoffice-deploy
* Проверить путь вызова триггера и вписать ID триггера в visualofficey/.gitlab-ci.yml
