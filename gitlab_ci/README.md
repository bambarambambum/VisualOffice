# Gitlab CI/CD
C помощью Gitlab реализован конвеер CI/CD.
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

## Описание CI конвеера visualoffice
Конвеер поделен на несколько этапов и задач
* test - тестирование (ненастроено)
* build - сборка образов 
* - build userapi - задача сборки образа usersapi
* - build webappsite - задача сборки образа webappsite
* review - проверка работоспособности образов
* - review usersapi - задача запуска образа usersapi
* - review webappsite - задача запуска образа webappsite
* release - публикация образов (только в ветке мастер)
* - release usersapi - задача публикации образа usersapi
* - release webappsite - задача публикации образа webappsite
* cleanup - удаление запущенных образов
* - cleanup usersapi - задача удаления запущенного образа usersapi
* - cleanup webappsite - задача удаления запущенного образа webappsite
## Описание CD конвеера visualoffice-deploy
Конвеер поделен на несколько этапов и задач
* test - тестирование (ненастроено)
* staging - Сборка приложения в окружении staging
* production - Сборка приложения в окружении production 
