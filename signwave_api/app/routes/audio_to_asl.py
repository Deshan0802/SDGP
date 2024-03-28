from flask import Flask, Blueprint, request, jsonify, send_file
import assemblyai as aai
from app.helpers.assembly_ai import generate_transcript
from app.helpers.mda_trnsl import generate_translation


audio_to_asl_bp = Blueprint("audio-to-asl", __name__)

translation_video = None

@audio_to_asl_bp.route("/upload-audio", methods=["POST"])
def audio_to_text():
    global translation_video
    if "audio" not in request.files:
        return "", 400
    file = request.files["audio"]
    
    
    if file.filename == "":
        return "", 400
    audio_file = file.filename
    file.save(audio_file)
    transcript = generate_transcript(audio_file)
    translation_video = generate_translation(transcript)
    return "", 200

@audio_to_asl_bp.route("/download-translation-audio", methods=["GET"])
def send_translation():
    translation_video_path = "../../" + translation_video
    return send_file(translation_video_path)
