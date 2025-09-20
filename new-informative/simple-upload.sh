#!/bin/bash

echo "🚀 Простая загрузка на GoDaddy через SFTP"
echo "========================================="

echo "Введите ваши FTP данные:"
read -p "FTP Server: " FTP_SERVER
read -p "FTP Username: " FTP_USER

echo "Создаем команды для SFTP..."
cat > commands.txt << EOL
cd public_html
put index.html
put styles.css  
put script.js
ls -la
bye
EOL

echo "Подключаемся к SFTP..."
echo "Выполните команды из файла commands.txt"
sftp "$FTP_USER@$FTP_SERVER"

rm commands.txt
echo "Готово!"
