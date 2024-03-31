from flask import Blueprint, request, jsonify
from app.models import db, User

sign_up_bp = Blueprint("sign-up", __name__)


@sign_up_bp.route("/sign-up", methods=["POST"])
def sign_up():
    if not request.is_json:
        return jsonify({"message": "Request must be JSON"}), 400

    data = request.json
    first_name = data.get("first_name")
    last_name = data.get("last_name")
    email = data.get("email")
    username = data.get("username")
    password = data.get("password")
    password_confirmed = data.get("password_confirmed")

    if not all([first_name, last_name, email, username, password, password_confirmed]):
        return jsonify({"message": "One or more fields are empty"}), 400

    if password != password_confirmed:
        return jsonify({"message": "Passwords do not match"}), 400

    existing_user = User.query.filter_by(username=username).first()

    if existing_user:
        return jsonify({"message": "Username is already taken"}), 400

    new_user = User(
        first_name=first_name,
        last_name=last_name,
        email=email,
        username=username,
        password=password,
    )
    db.session.add(new_user)
    db.session.commit()

    return jsonify({"message": "Registration Successful"}), 200
