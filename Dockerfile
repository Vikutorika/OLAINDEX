FROM php:7-cli-alpine

LABEL maintainer.name="xczh" \
      maintainer.email="xczh.me@foxmail.com" \
      maintainer.description="OLAINDEX: Another OneDrive Directory Index"

ENV LANG=C.UTF-8

WORKDIR /OLAINDEX

RUN apk add --no-cache tzdata git composer && \
    echo "Asia/Shanghai" > /etc/timezone && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    apk del tzdata && \
    docker-php-ext-install bcmath && \
    git clone --depth 1 https://github.com/WangNingkai/OLAINDEX.git . && \
    composer install -vvv && \
    composer run install-app

EXPOSE 8000

CMD ["php artisan serve --host=0.0.0.0 --port=8000 --tries=0 --no-interaction"]
