# Docker
C помощью docker происходит сборка нового образа базы данных MySQL (на основе mysql:8.0.20) с добавлением в него бэкапа базы данных.

## Файловая схема
- docker
- - mysql
- - - Dockerfile
- - - visualoffice.sql - Дамп базы данных
- - README.md

### Запускаем
Сборка образа (из папки docker/mysql)
```sh
$ docker build -t androsovm/mysql .
```
Публикуем:
```sh
$ docker push androsovm/mysql
```