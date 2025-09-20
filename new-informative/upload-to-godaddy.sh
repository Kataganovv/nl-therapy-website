#!/bin/bash

echo "🚀 Загрузка NLT сайта на GoDaddy"
echo "=================================="

# Цвета для вывода
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}Введите ваши FTP данные:${NC}"
read -p "FTP Server (например: ftp.your-domain.com): " FTP_SERVER
read -p "FTP Username: " FTP_USER
read -s -p "FTP Password: " FTP_PASS
echo

echo -e "${BLUE}Подключаемся к $FTP_SERVER...${NC}"

# Создаем временный файл с командами SFTP
cat > sftp_commands.txt << EOL
cd public_html
put index.html
put styles.css
put script.js
chmod 644 index.html
chmod 644 styles.css
chmod 644 script.js
ls -la
quit
EOL

# Выполняем загрузку
echo -e "${BLUE}Загружаем файлы...${NC}"
sshpass -p "$FTP_PASS" sftp -o StrictHostKeyChecking=no -b sftp_commands.txt "$FTP_USER@$FTP_SERVER"

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Файлы успешно загружены!${NC}"
    echo -e "${GREEN}🌐 Проверьте ваш сайт: https://your-domain.com${NC}"
else
    echo -e "${RED}❌ Ошибка при загрузке${NC}"
fi

# Удаляем временный файл
rm -f sftp_commands.txt

echo -e "${BLUE}Готово!${NC}"
