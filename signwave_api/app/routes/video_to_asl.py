from flask import Blueprint, request, send_file
from app.helpers.assembly_ai import generate_transcript
from app.helpers.mda_trnsl import generate_translation

video_to_asl_bp = Blueprint("video-to-asl", __name__)

translation_video = None


@video_to_asl_bp.route("/upload-video", methods=["POST"])
def get_file():
    global translation_video
    if "video" not in request.files:
        return "", 400
    file = request.files["video"]
    if file.filename == "":
        return "", 400
    video_file = file.filename
    file.save(video_file)
    transcript = generate_transcript(video_file)
    translation_video = generate_translation(transcript)
    return "", 200


@video_to_asl_bp.route("/download-translation-video", methods=["GET"])
def send_translation():
    translation_video_path = "../../" + translation_video
    return send_file(translation_video_path)
