from flask import Blueprint, request, jsonify
from app.helpers.transcriber import transcribe_file

audio_to_asl_bp = Blueprint("audio-to-asl", __name__)


@audio_to_asl_bp.route("/audio-to-asl", methods=["POST"])
def audio_to_asl():
    file_url = ""
    transcript_text = transcribe_file(file_url)

    if transcript_text:
        return jsonify({"transcript": transcript_text}), 200
    else:
        return jsonify({"error": "Transcription failed"}), 500
