FROM ubuntu:latest

# Шаг 1: Тяжелый шаг — скачиваем обновления и ставим curl
RUN apt-get update && apt-get install -y curl

# Шаг 2: Легкий шаг — копируем наш файл
COPY info.txt /app/info.txt

