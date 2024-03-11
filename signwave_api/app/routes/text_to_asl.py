from flask import Blueprint, request, jsonify

text_to_asl_bp = Blueprint("text-to-asl", __name__)


@text_to_asl_bp.route("/text-to-asl", methods=["POST"])
def textToAsl():
    data = request.form
    text = data.get('text')
    print('Received text:', text)
    return jsonify({'message': 'Text received', 'text': text})
