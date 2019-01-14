FROM alpine:3.8

COPY ./healthcheck.sh .

RUN apk add --no-cache curl wget jq netcat-openbsd
RUN chmod 755 ./healthcheck.sh

CMD . ./healthcheck.sh