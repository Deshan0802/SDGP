from flask import Blueprint, jsonify, session


profile_bp = Blueprint("profile", __name__)


@profile_bp.route("/profile", methods=["GET"])
def get_profile():
    first_name = session.get('first_name')
    last_name = session.get('last_name')
    email = session.get('email')

    print(session)
    user_details = {
        "first_name": first_name,
        "last_name": last_name,
        "email": email
    }
    print(user_details)

    return jsonify({"user_details": user_details}), 200
