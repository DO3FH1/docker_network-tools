# Используем Alpine Linux как базовый образ
FROM alpine:latest

# Обновляем индекс пакетов и устанавливаем необходимые утилиты
RUN apk update && apk add --no-cache \
    curl \
    tcpdump \
    wireshark-common \
    iproute2 \
    net-tools \
    bind-tools \
    wget \
    grep \
    gawk \
    sysstat \
    atop \
    traceroute \
    busybox-extras \
    ncurses

# Создаем символическую ссылку для tshark
RUN ln -s /usr/bin/tshark /usr/local/bin/tshark

# Очищаем кэш пакетов для уменьшения размера образа
RUN rm -rf /var/cache/apk/*

# Устанавливаем рабочую директорию
WORKDIR /root

# Запускаем оболочку по умолчанию
CMD ["/bin/sh"]
