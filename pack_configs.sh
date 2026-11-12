cd /home/arak/devops_lab
SOURCE_DIR="configs"
BACKUP_DIR="backups"
TIMESTAMP=$(date "+%Y%m%d_%H%M%S")
ARCHIVE_NAME="configs_backup_${TIMESTAMP}.tar.gz"

echo "=== Старт процесса архивации ==="

# 1. Проверяем существование папки для бэкапов, если нет — создаем (&& в действии)
[ ! -d "$BACKUP_DIR" ] && mkdir -p "$BACKUP_DIR"

# 2. Циклом for выводим, какие файлы мы нашли для бэкапа
echo "Найдены следующие файлы конфигурации:"
for FILE in "$SOURCE_DIR"/*; do
    echo "-> Готовлю к упаковке: $FILE"
done

# 3. Архивируем папку configs
echo "Создаю архив: $ARCHIVE_NAME..."
tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" "$SOURCE_DIR"

# 4. Проверяем код возврата tar
if [ $? -eq 0 ]; then
    echo "✅ Бэкап успешно создан в: $BACKUP_DIR/$ARCHIVE_NAME"
    echo "Размер архива: $(ls -lh "$BACKUP_DIR/$ARCHIVE_NAME" | awk '{print $5}')"
    
    # Выведем список содержимого архива через tar -tf
    echo "Содержимое архива:"
    tar -tf "$BACKUP_DIR/$ARCHIVE_NAME"
else
    echo "❌ Ошибка при создании архива!"
    exit 1
fi

# Удаляем архивы старше 2 минут (для теста), чтобы не копить мусор
echo "Очистка: удаляю бэкапы старше 2 минут..."
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mmin +2 -delete
