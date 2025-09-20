#!/bin/bash

echo "🔍 Тестируем подключение к FTP серверу"
echo "======================================"

read -p "Введите FTP сервер (например: ftp.your-domain.com): " FTP_SERVER
read -p "Введите FTP логин: " FTP_USER

echo "Пробуем подключиться к $FTP_SERVER..."
echo "Если запросит пароль - введите его"

# Тестовое подключение
timeout 10 sftp -o ConnectTimeout=5 "$FTP_USER@$FTP_SERVER" << 'EOL'
pwd
ls
quit
EOL

if [ $? -eq 0 ]; then
    echo "✅ Подключение успешно!"
else
    echo "❌ Не удалось подключиться. Проверьте данные."
fi
