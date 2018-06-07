FROM jenkins/jenkins:latest

COPY plugins.txt /plugins.txt
USER root
ENV  DEBIAN_FRONTEND noninteractive
ENV  TimeZone=Asia/Shanghai

RUN /usr/local/bin/plugins.sh /plugins.txt \
    && apt-get update \
    && apt-get install -y locales \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen en_US.UTF-8 \
    && dpkg-reconfigure locales \
    && /usr/sbin/update-locale LANG=en_US.UTF-8 \

RUN ln -snf /usr/share/zoneinfo/${TimeZone} /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

ENV LC_ALL en_US.UTF-8
