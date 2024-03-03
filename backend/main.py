from flask import Flask, jsonify, request
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'user_accounts'

mysql = MySQL(app)

@app.route('/')
def index():
    if mysql.connection:
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM users")
        users = cursor.fetchall()
        cursor.close()
        return jsonify(users)
    else:
        return '<p>Failed to connect to the database.</p>'

if __name__ == "__main__":
    app.run(debug=True, port=8000)