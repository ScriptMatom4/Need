FROM ubuntu:20.04

# Установка зависимостей
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y squid curl wget unzip && \
    rm -rf /var/lib/apt/lists/*

# Установка Cloudflare Tunnel
RUN wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O /usr/local/bin/cloudflared && \
    chmod +x /usr/local/bin/cloudflared

# Копируем конфиги
COPY squid.conf /etc/squid/squid.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 80

CMD ["/start.sh"]
