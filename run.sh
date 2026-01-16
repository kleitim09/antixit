#!/data/data/com.termux/files/usr/bin/bash

clear

# Cabeçalho
cat << "EOF"
===========================
      ANTI-XIT OFICIAL
===========================
Se tiver de xit nós vai achar 😈
Criador: MORFEO
Discord: https://discord.gg/XrQ7jWA4
===========================
EOF

echo "🔒 Iniciando verificação completa..."
read -p "⏎ Pressione ENTER para continuar..."

# ===========================
# INFORMAÇÕES DO DISPOSITIVO
# ===========================
clear
echo "==========================="
echo " 🔎 INFORMAÇÕES DO DISPOSITIVO"
echo "==========================="

MARCA=$(getprop ro.product.manufacturer)
MODELO=$(getprop ro.product.model)
DISPOSITIVO=$(getprop ro.product.device)
ANDROID=$(getprop ro.build.version.release)
SDK=$(getprop ro.build.version.sdk)

echo "📱 Marca: $MARCA"
echo "📱 Modelo: $MODELO"
echo "📱 Dispositivo: $DISPOSITIVO"
echo "🤖 Android: $ANDROID (SDK $SDK)"

read -p "⏎ Pressione ENTER para continuar..."

# ===========================
# DATA / HORA / FUSO
# ===========================
clear
echo "==========================="
echo " 🕒 DATA / HORA / FUSO"
echo "==========================="

DATA=$(date)
FUSO=$(getprop persist.sys.timezone)

echo "⏰ Data/Hora atual: $DATA"
echo "🌎 Fuso horário: $FUSO"

AUTO_DATA=$(settings get global auto_time)
AUTO_FUSO=$(settings get global auto_time_zone)

if [ "$AUTO_DATA" != "1" ]; then
  echo "❌ Data/Hora automática: DESATIVADA (W.O)"
fi

if [ "$AUTO_FUSO" != "1" ]; then
  echo "❌ Fuso horário automático: DESATIVADO (W.O)"
fi

read -p "⏎ Pressione ENTER para continuar..."

# ===========================
# LOCALIZAÇÃO POR IP
# ===========================
clear
echo "==========================="
echo " 🌐 LOCALIZAÇÃO POR IP"
echo "==========================="

IP=$(curl -s ifconfig.me)
INFO=$(curl -s ipinfo.io/$IP/json)

echo "🌐 IP Público: $IP"
echo "$INFO" | grep city
echo "$INFO" | grep region
echo "$INFO" | grep country

read -p "⏎ Pressione ENTER para continuar..."

# ===========================
# VARREDURA DE ARQUIVOS
# ===========================
clear
echo "==========================="
echo " 📁 VARREDURA DE ARQUIVOS"
echo "==========================="

ENCONTROU=0
LISTA=("xit" "aimbot" "cheat" "hack" "cfg" "regedit" "macro")

for PALAVRA in "${LISTA[@]}"; do
  RESULT=$(find /sdcard /storage/emulated/0 2>/dev/null | grep -i "$PALAVRA" | head -n 1)
  if [ ! -z "$RESULT" ]; then
    echo "❌ XIT ENCONTRADO: $PALAVRA"
    echo "📁 Caminho: $RESULT"
    ENCONTROU=1
  fi
done

# ===========================
# RESULTADO FINAL
# ===========================
echo
echo "==========================="
echo " 📊 RESULTADO FINAL"
echo "==========================="

if [ "$ENCONTROU" -eq 1 ]; then
  echo "🚨🚨🚨 XIT ENCONTRADO 🚨🚨🚨"
  echo "🚫 DISPOSITIVO COMPROMETIDO"
  echo "⚠️ APLIQUE O W.O IMEDIATAMENTE"
  echo
  echo "🔢 Nota do dispositivo: 0 / 10"
  echo "🚨 STATUS: DISPOSITIVO COMPROMETIDO"
else
  echo "✅ Nenhum xit encontrado"
  echo
  echo "🔢 Nota do dispositivo: 10 / 10"
  echo "✅ STATUS: LIMPO"
fi

echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🚨 NÃO FECHE ESSA TELA 🚨"
echo "📌 Revise TODAS as informações acima"
echo "📸 Tire prints para comprovação"
echo "⛔ NÃO HÁ RETORNO AO MENU ⛔"

read -p "⏎ Pressione ENTER para finalizar..."
