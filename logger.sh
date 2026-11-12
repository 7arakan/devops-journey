#!/bin/bash
while true; do
    echo "[$(date)] Сервис работает штатно, память свободна: $(free -h | awk '/Mem:/ {print $4}')"
    sleep 5
done
