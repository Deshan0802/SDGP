import assemblyai as aai
from config import Config


def generate_transcript(file):
    aai.settings.api_key = Config.ASSEMBLYAI_API_KEY
    transcriber = aai.Transcriber()
    transcript = transcriber.transcribe(file)
    if transcript.status == aai.TranscriptStatus.error:
        return ""
    return transcript.text
