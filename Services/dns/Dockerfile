FROM debian:bookworm-slim

# Image minimale : uniquement bind9 + les utilitaires de diag (dig, pour le healthcheck)
RUN apt-get update && \
    apt-get install -y --no-install-recommends bind9 bind9-utils dnsutils && \
    rm -rf /var/lib/apt/lists/*

# Le paquet bind9 crée déjà l'utilisateur système "bind"
RUN chown -R bind:bind /etc/bind /var/cache/bind

EXPOSE 53/udp 53/tcp

USER bind

ENTRYPOINT ["/usr/sbin/named", "-g", "-u", "bind", "-c", "/etc/bind/named.conf"]
