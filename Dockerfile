FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null

RUN apt-get update -y && \
    apt-get install -yqq locales  && \
    apt-get install -yqq \
        python \
        python3-pip \
        sudo \
        curl \
        npm \
        make \
        build-essential \
        wget \
        nano \
        git && \
    git clone https://github.com/botgram/shell-bot.git && \
    cd shell-bot && \
    npm install && \
    pip3 install telethon
COPY config.json /shell-bot/config.json
CMD ["node", "/shell-bot/server"]
