from flask import Blueprint, request, send_file
from youtube_transcript_api import YouTubeTranscriptApi
from app.helpers.mda_trnsl import generate_translation

youtube_to_asl_bp = Blueprint("youtube-to-asl", __name__)

translation_video = None


@youtube_to_asl_bp.route("/upload-youtube-url", methods=["POST"])
def get_youtube_url():
    global translation_video
    data = request.json
    youtube_url = data.get("youtube_url")
    transcript = YouTubeTranscriptApi.get_transcript(youtube_url)
    formatted_transcript = " ".join(item["text"] for item in transcript)
    translation_video = generate_translation(formatted_transcript)
    return "", 200


@youtube_to_asl_bp.route("/download-translation-youtube", methods=["GET"])
def send_translation():
    translation_video_path = "../../" + translation_video
    return send_file(translation_video_path)
