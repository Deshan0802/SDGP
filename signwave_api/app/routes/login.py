from flask import Blueprint, request, jsonify,session
from app.models import User

login_bp = Blueprint("login", __name__)

@login_bp.route("/login", methods=["POST"])
def login():
    if not request.is_json:
        return jsonify({"message": "Request must be JSON"}), 400

    data = request.json
    username = data.get("username")
    password = data.get("password")

    if not username:
        return jsonify({"message": "Username is required"}), 400

    if not password:
        return jsonify({"message": "Password is required"}), 400

    user = User.query.filter_by(username=username, password=password).first()

    if user:
        session['first_name'] = user.first_name
        session['last_name'] = user.last_name
        session['email'] = user.email
        print("Session Data Set Successfully:", session)

        return jsonify({
            "message": "Login Successful, Welcome back!",
            "user_details": {
                "first_name": user.first_name,
                "last_name": user.last_name,
                "email": user.email
            }
        
        }), 200
        
    else:
        return jsonify({"message": "Invalid username or password"}), 401