from flask import Flask, request
import pickle
from base64 import b64decode

app = Flask(__name__)

@app.get("/")
def main():
    s = request.args.get("s", "")
    if not s:
        return "Hello World"
    s = pickle.loads(b64decode(s.encode()))
    return s
