from flask import Blueprint, request, jsonify
from app.models import User

login_bp = Blueprint("login", __name__)


@login_bp.route("/login", methods=["POST"])
def login():
    if not request.is_json:
        return jsonify({"error": "Request must be JSON"}), 400

    data = request.json
    username = data.get("username")
    password = data.get("password")

    if not username:
        return jsonify({"error": "Username is required"}), 400

    if not password:
        return jsonify({"error": "Password is required"}), 400

    user = User.query.filter_by(username=username, password=password).first()

    if user:
        return jsonify({"success": True}), 200
    else:
        return jsonify({"error": "Invalid username or password"}), 401
