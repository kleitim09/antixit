#!/data/data/com.termux/files/usr/bin/bash

# Limpa a tela
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

# Início da verificação
echo "🔒 Iniciando verificação completa..."
read -p "⏎ Pressione ENTER para continuar..."

# INFORMAÇÕES DO DISPOSITIVO
clear
echo "==========================="
echo " INFORMAÇÕES DO DISPOSITIVO"
echo "==========================="
echo "📱 Marca: $(getprop ro.product.brand)"
echo "📱 Modelo: $(getprop ro.product.model)"
echo "📱 Dispositivo: $(getprop ro.product.device)"
echo "🤖 Android: $(getprop ro.build.version.release) (SDK $(getprop ro.build.version.sdk))"
read -p "⏎ Pressione ENTER para continuar..."

# DATA / HORA / FUSO
clear
echo "==========================="
echo " DATA / HORA / FUSO"
echo "==========================="
echo "⏰ Data/Hora atual: $(date)"
echo "🌎 Fuso horário: $(getprop persist.sys.timezone)"
echo "❌ Data/Hora automática: $(getprop persist.sys.timezone.auto)"
echo "❌ Fuso horário automático: $(getprop persist.sys.timezone.auto)"
echo "⚠️ Avaliar manualmente se fuso estiver diferente do BR"
read -p "⏎ Pressione ENTER para continuar..."

# LOCALIZAÇÃO POR IP
clear
echo "==========================="
echo " LOCALIZAÇÃO POR IP"
echo "==========================="
IP=$(curl -s ifconfig.me)
CITY=$(curl -s ipinfo.io/$IP/city)
STATE=$(curl -s ipinfo.io/$IP/region)
COUNTRY=$(curl -s ipinfo.io/$IP/country)
echo "🌐 IP Público: $IP"
echo "📍 Cidade (estimada): $CITY"
echo "📍 Estado (estimado): $STATE"
echo "🌎 País: $COUNTRY"
read -p "⏎ Pressione ENTER para continuar..."

# VARREDURA DE ARQUIVOS
clear
echo "==========================="
echo " VARREDURA DE ARQUIVOS"
echo "==========================="
FILES=$(find ~/storage -type f -iname "*xit*" -o -iname "*aimbot*" 2>/dev/null)

if [ -z "$FILES" ]; then
  echo "✅ Nenhum nome proibido encontrado nos diretórios acessíveis"
  SCORE=10
  STATUS="✅ STATUS: LIMPO"
else
  echo "$FILES" | while read file; do
    echo "❌ XIT ENCONTRADO: $(basename "$file")"
    echo "📁 Caminho: $file"
  done
  SCORE=0
  STATUS="🚨 STATUS: DISPOSITIVO COMPROMETIDO"
fi
read -p "⏎ Pressione ENTER para continuar..."

# PONTUAÇÃO FINAL
clear
echo "==========================="
echo " 📊 PONTUAÇÃO FINAL"
echo "==========================="
echo "🔢 Nota do dispositivo: $SCORE / 10"
echo "$STATUS"

# RELATÓRIO FINAL
echo
echo "==========================="
echo " 📄 RELATÓRIO FINALIZADO"
echo "==========================="
echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🚨 NÃO FECHE ESSA TELA 🚨"
echo "📌 Revise TODAS as informações acima"
echo "📸 Tire prints para comprovação"
echo "⛔ SISTEMA BLOQUEADO APÓS DETECÇÃO ⛔"
echo "⛔ NÃO HÁ RETORNO AO MENU ⛔"
read -p "⏎ Pressione ENTER para finalizar..."
