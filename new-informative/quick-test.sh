#!/bin/bash

echo "🚀 БЫСТРАЯ ПРОВЕРКА САЙТА nl-therapy.com"
echo "========================================"

echo "1. Проверяем доступность сайта..."
curl -I https://nl-therapy.com 2>/dev/null | head -1

echo "2. Проверяем www версию..."
curl -I https://www.nl-therapy.com 2>/dev/null | head -1

echo "3. Проверяем основные файлы..."
echo "   - index.html:"
curl -s https://nl-therapy.com/ | grep -q "NLT" && echo "   ✅ Найден" || echo "   ❌ Не найден"

echo "   - styles.css:"
curl -I https://nl-therapy.com/styles.css 2>/dev/null | head -1

echo "   - script.js:"
curl -I https://nl-therapy.com/script.js 2>/dev/null | head -1

echo "4. Проверяем SSL сертификат..."
openssl s_client -connect nl-therapy.com:443 -servername nl-therapy.com < /dev/null 2>/dev/null | grep -q "Verify return code: 0" && echo "   ✅ SSL работает" || echo "   ⚠️ Проблемы с SSL"

echo ""
echo "🌐 Откройте в браузере:"
echo "   https://nl-therapy.com"
echo "   https://www.nl-therapy.com"
