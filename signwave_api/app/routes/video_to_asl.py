from flask import Blueprint, request
from app.helpers.assembly_ai import generate_transcript
from app.helpers.mda_trnsl import translate

video_to_asl_bp = Blueprint("video-to-asl", __name__)


@video_to_asl_bp.route("/video-to-asl", methods=["POST"])
def video_to_asl():
    if "video" not in request.files or request.files["video"].filename == "":
        return "", 400
    file = request.files["video"]
    file.save(file.filename)
    transcript = generate_transcript(file.filename)
    video_files = translate(transcript)
