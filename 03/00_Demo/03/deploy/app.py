from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Willkommen im Modul 347!"

# port 5000 added
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3000)
