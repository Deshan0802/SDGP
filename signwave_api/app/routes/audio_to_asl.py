from flask import Flask, Blueprint, request, jsonify
import assemblyai as aai


aai.settings.api_key = "1d3be8d88bba446aac7c750f5a191612"

audio_to_asl_bp = Blueprint("audio-to-asl", __name__)

@audio_to_asl_bp.route("/audio-to-asl", methods=["POST"])
def audio_to_text():
    print("Hello world")
    try:
        if 'audio' not in request.files:
            return jsonify({'error': 'No audio file provided'}), 400
        
        file = request.files['audio']
        
        file_name = file.filename
        print(file_name)
        file.save(file_name)
        
        transcriber = aai.Transcriber()
        transcript = transcriber.transcribe(file_name)
    
        if transcript.status == aai.TranscriptStatus.error:
            return jsonify({'error': transcript.error}), 500
        else:
            return jsonify({'transcript': transcript.text}), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500

