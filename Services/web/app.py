from flask import Flask

app = Flask(__name__)


@app.route("/")
def index():
    return "<h1>SAE5.01 - Serveur Web Flask</h1><p>192.168.20.10</p>"


if __name__ == "__main__":
    app.run()
