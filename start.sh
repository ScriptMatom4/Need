#!/bin/bash

# Запуск Squid
squid

# Подключение Cloudflare Tunnel
cloudflared tunnel --url http://localhost:80 --no-autoupdate
