#!/usr/bin/env bash

LOGFILE="$HOME/mine-server/logs/latest.log"

if pgrep -f "java" > /dev/null; then
    # Verifica se já apareceu alguma linha com "Done" (ignora maiúsculas/minúsculas)
    STATUS=$(grep -i "Done" "$LOGFILE" | grep -i "for help" | tail -1)
    
    if [[ -n "$STATUS" ]]; then
        echo "🟢 [ONLINE] $STATUS"
    else
        echo "👻 [INICIALIZANDO] Servidor está iniciando..."
    fi
else
    echo "🔴 [OFFLINE] Servidor Minecraft offline."
fi
