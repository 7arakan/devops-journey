#!/bin/bash

CONFIG_PATH=$1

# 1. Проверяем: передал ли пользователь аргумент вообще?
if [ -z "$CONFIG_PATH" ]; then
    echo "❌ Ошибка: Вы не указали путь к файлу конфига!"
    echo "Использование: $0 <путь_к_файлу>"
    exit 1
fi

# 2. Проверяем: существует ли такой файл на диске?
if [ -f "$CONFIG_PATH" ]; then
    echo "✅ Файл $CONFIG_PATH найден!"
    
    # Проверим, не пустой ли он
    if [ -s "$CONFIG_PATH" ]; then
        echo "📄 Файл содержит данные. Размер: $(wc -c < "$CONFIG_PATH") байт."
        exit 0
    else
        echo "⚠️ Предупреждение: Файл существует, но он пустой!"
        exit 2
    fi
else
    echo "❌ Ошибка: Файл $CONFIG_PATH не существует на диске!"
    exit 3
fi
