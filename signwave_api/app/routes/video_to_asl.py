from flask import Blueprint, request, jsonify
from app.helpers.transcriber import transcribe_file

video_to_asl_bp = Blueprint("video-to-asl", __name__)


@video_to_asl_bp.route("/video-to-asl", methods=["POST"])
def video_to_asl():
    file_url = ""
    transcript_text = transcribe_file(file_url)

    if transcript_text:
        return jsonify({"transcript": transcript_text}), 200
    else:
        return jsonify({"error": "Transcription failed"}), 500
