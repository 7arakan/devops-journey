#!/bin/bash

if [ "$1" = "start" ]; then
echo "Собираю образ..."
docker build -t pure-web:v1 .
echo "Запускаю контейнер..."
docker run -d --name pure-site -p 8090:80 pure-web:v1
echo "✅ Сервис запущен на порту 8090!"
elif [ "$1" = "status" ]; then
echo "=== Статус контейнера ==="
docker ps | grep pure-site || echo "⚠️ Контейнер не запущен!"
echo "=== Проверка HTTP-ответа ==="
curl -I http://localhost:8090
elif [ "$1" = "stop" ]; then
docker rm -f pure-site
echo "pure-site остоновлен и удален"
else
    echo "Использование: $0 {start|status|stop}"
    exit 1
fi

