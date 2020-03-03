FROM node:lts-alpine

ARG TARGET=local
WORKDIR /home/node/server

RUN apk add --no-cache --update curl && npm install && npm run build

COPY echo-${TARGET}.json /home/node/server/laravel-echo-server.json

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl --fail http://localhost:6001 || exit 1

CMD ./laravel-echo-server start
