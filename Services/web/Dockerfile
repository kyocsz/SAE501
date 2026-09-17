FROM python:3.12-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends openssl curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# Certificat auto-signé généré au build (labo isolé -> pas de CA publique).
# Normal que le navigateur affiche un avertissement, c'est attendu ici.
RUN mkdir -p /app/certs && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
      -keyout /app/certs/web.key \
      -out /app/certs/web.crt \
      -subj "/C=FR/ST=HautsDeFrance/L=Bethune/O=IUT-Bethune/CN=web.lab.local"

RUN useradd -r -s /usr/sbin/nologin flaskuser && \
    chown -R flaskuser:flaskuser /app

EXPOSE 443/tcp

USER flaskuser

CMD ["gunicorn", "--bind", "0.0.0.0:443", \
     "--certfile", "/app/certs/web.crt", \
     "--keyfile", "/app/certs/web.key", \
     "app:app"]
