FROM alpine

RUN apk add git curl

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]