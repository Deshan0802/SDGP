from flask import Flask

app = Flask(__name__)

@app.route("/")
def method_one():
    return "<p>Root</p>"

@app.route("/text-to-asl")
def method_two():
    return "<p>text-to-asl</p>"

@app.route("/audio-to-asl")
@app.route("/video-to-asl")
def method_three():
    return "<p>audio-to-asl, video-to-asl</p>"

if __name__ == "__main__":
    app.run(debug=True)