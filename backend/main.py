from flask import Flask, request, jsonify
from flask_mysqldb import MySQL

app = Flask(__name__)
app.config["MYSQL_HOST"] = "localhost"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = ""
app.config["MYSQL_DB"] = "user_accounts"
mysql = MySQL(app)


@app.route("/register", methods=["POST"])
def register_user():
    if not request.is_json:
        return jsonify({"error": "Request must be JSON"}), 400
    data = request.json
    username = data.get("username")
    password = data.get("password")
    password_confirmed = data.get("password_confirmed")
    return jsonify({"message": "Registration successful"}), 200
    # if mysql.connection:
    #     cursor = mysql.connection.cursor()
    #     cursor.execute("SELECT * FROM users")
    #     users = cursor.fetchall()
    #     cursor.close()
    #     return jsonify(users)
    # else:
    #     return ""


@app.route("/login", methods=["POST"])
def login():
    if not request.is_json:
        return jsonify({"error": "Request must be JSON"}), 400

    username = request.json.get("username", "")
    password = request.json.get("password", "")

    if username == "example_username" and password == "example_password":
       
        token = "example_token"
        return jsonify({"message": "Login successful", "token": token}), 200
    else:
        return jsonify({"error": "Invalid username or password"}), 401


if __name__ == "__main__":
    app.run(debug=True, port=8000)
