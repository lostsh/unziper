FROM alpine:latest

RUN apk add unzip
RUN adduser --disabled-password user

USER user
WORKDIR /home/user/
CMD unzip *.zip