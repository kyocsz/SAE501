FROM alpine:latest

RUN apk add --no-cache nftables iproute2

COPY loader.sh /loader.sh
RUN chmod +x /loader.sh

ENTRYPOINT ["/loader.sh"]
