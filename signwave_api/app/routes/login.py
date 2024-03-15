from flask import Blueprint, request, jsonify
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
        return jsonify({"message": "Login Successful, Welcome back!"}), 200
    else:
        return jsonify({"message": "Invalid username or password"}), 401
