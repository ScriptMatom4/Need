FROM alpine:latest

RUN apk add --no-cache dante-server

COPY danted.conf /etc/

EXPOSE 1080

CMD ["sockd", "-f", "/etc/danted.conf"]
