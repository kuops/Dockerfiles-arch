FROM kuops/node:latest

RUN apk add --no-cache git \
    && yarn global add hexo

WORKDIR /app

CMD [ "hexo","server","-l" ]