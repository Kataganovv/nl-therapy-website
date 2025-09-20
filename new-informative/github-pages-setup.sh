#!/bin/bash

echo "🆓 Настройка GitHub Pages для nl-therapy.com"
echo "============================================"

# Проверяем git
if ! command -v git &> /dev/null; then
    echo "❌ Git не установлен"
    exit 1
fi

echo "1. Инициализируем git репозиторий..."
git init

echo "2. Добавляем файлы..."
git add index.html styles.css script.js

echo "3. Делаем первый коммит..."
git commit -m "Initial commit: NLT website"

echo "4. Инструкции для GitHub:"
echo "   - Создайте репозиторий на github.com"
echo "   - Название: nl-therapy-website"
echo "   - Выполните команды:"
echo ""
echo "   git remote add origin https://github.com/YOUR-USERNAME/nl-therapy-website.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "5. В настройках репозитория:"
echo "   - Pages → Source → Deploy from a branch"
echo "   - Branch: main"
echo ""
echo "6. В DNS панели GoDaddy добавьте:"
echo "   - CNAME: www → YOUR-USERNAME.github.io"
echo "   - A Record: @ → 185.199.108.153"
echo "   - A Record: @ → 185.199.109.153"
echo "   - A Record: @ → 185.199.110.153"
echo "   - A Record: @ → 185.199.111.153"

