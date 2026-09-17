FROM alpine:3.20

RUN apk add --no-cache dnsmasq

COPY dnsmasq.conf /etc/dnsmasq.conf

EXPOSE 67/udp

ENTRYPOINT ["dnsmasq", "-k", "-C", "/etc/dnsmasq.conf"]
