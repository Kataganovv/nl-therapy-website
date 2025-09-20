#!/bin/bash

echo "🚀 ЗАГРУЗКА САЙТА НА nl-therapy.com"
echo "=================================="

# Цвета
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}Готовые файлы для загрузки:${NC}"
echo "✅ index.html (главная страница)"
echo "✅ styles.css (стили)"
echo "✅ script.js (функциональность)"

echo ""
echo -e "${YELLOW}ВАРИАНТЫ ЗАГРУЗКИ:${NC}"
echo "1. File Manager (через браузер GoDaddy)"
echo "2. FTP/SFTP (через терминал)"
echo "3. Создать ZIP архив для удобства"

read -p "Выберите вариант (1/2/3): " choice

case $choice in
    1)
        echo -e "${BLUE}📁 File Manager инструкция:${NC}"
        echo "1. Откройте: https://dcc.godaddy.com/control/"
        echo "2. Найдите: Web Hosting → nl-therapy.com → Manage"
        echo "3. Откройте: File Manager"
        echo "4. Перейдите в папку: public_html"
        echo "5. Загрузите файлы:"
        echo "   - index.html"
        echo "   - styles.css"
        echo "   - script.js"
        echo ""
        echo -e "${GREEN}Файлы находятся в:${NC}"
        echo "$(pwd)"
        ;;
    2)
        echo -e "${BLUE}🔗 FTP загрузка:${NC}"
        echo "Введите ваши FTP данные для nl-therapy.com:"
        read -p "FTP сервер (например: ftp.nl-therapy.com): " ftp_server
        read -p "FTP логин: " ftp_user
        
        echo -e "${BLUE}Подключаемся к $ftp_server...${NC}"
        
        # Создаем файл команд для SFTP
        cat > ftp_commands.txt << EOL
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

        echo "Выполните команду:"
        echo "sftp $ftp_user@$ftp_server"
        echo "Затем выполните команды из файла ftp_commands.txt"
        
        sftp "$ftp_user@$ftp_server"
        
        rm -f ftp_commands.txt
        ;;
    3)
        echo -e "${BLUE}📦 Создаем ZIP архив...${NC}"
        zip -r nl-therapy-website.zip index.html styles.css script.js
        echo -e "${GREEN}✅ Создан архив: nl-therapy-website.zip${NC}"
        echo ""
        echo "Теперь:"
        echo "1. Откройте File Manager в GoDaddy"
        echo "2. Перейдите в public_html"
        echo "3. Загрузите nl-therapy-website.zip"
        echo "4. Разархивируйте его"
        ;;
    *)
        echo -e "${RED}Неверный выбор${NC}"
        ;;
esac

echo ""
echo -e "${GREEN}После загрузки проверьте:${NC}"
echo "🌐 https://nl-therapy.com"
echo "📱 Мобильная версия"
echo "🔄 Переключение языков"
echo "📧 Форма обратной связи"
