from flask import Blueprint, request, send_file
from app.helpers.assembly_ai import generate_transcript
from app.helpers.mda_trnsl import translate

video_to_asl_bp = Blueprint("video-to-asl", __name__)

video_file = None


@video_to_asl_bp.route("/upload-video", methods=["POST"])
def get_file():
    global video_file
    if "video" not in request.files:
        return "", 400
    file = request.files["video"]
    if file.filename == "":
        return "", 400
    video_file = file.filename
    file.save(video_file)
    return "", 200


@video_to_asl_bp.route("/download-translation", methods=["GET"])
def send_translation():
    global video_file
    transcript = generate_transcript(video_file)
    translation_video = translate(transcript)
    translation_video_path = "../../" + translation_video
    return send_file(translation_video_path)
