import assemblyai as aai
from config import Config

aai.settings.api_key = aai.settings.api_key = Config.ASSEMBLYAI_API_KEY


def transcribe_file(file_url):
    transcriber = aai.Transcriber()
    transcript = transcriber.transcribe(file_url)

    if transcript.status == aai.TranscriptStatus.error:
        return transcript.error
    else:
        return transcript.text
