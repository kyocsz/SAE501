FROM alpine:latest

RUN apk add --no-cache nftables iproute2

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/loader.sh"]
