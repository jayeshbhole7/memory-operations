from flask import Flask, render_template, request

import os

app = Flask(__name__)

UPLOAD_FOLDER='uploads'
if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

@app.route("/")
def why():
    return render_template("html.html")

@app.route("/casted", method=["POST"])
def upload():
    file=request.files["file"]
    file.save(os.path.join(UPLOAD_FOLDER, file.filename))
    return "file uploaded!"

if __name__== "__main__":
    app.run(debug=True)