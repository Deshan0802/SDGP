import re
import requests
from pose_format import Pose
from pose_format.pose_visualizer import PoseVisualizer


def chunk_text(text):
    max_chunk_size = 500
    words = re.findall(r"\b\w+\b", text)
    chunks = []
    current_chunk = ""
    for word in words:
        if len(current_chunk) + len(word) + 1 <= max_chunk_size:
            if current_chunk:
                current_chunk += " "
            current_chunk += word
        else:
            chunks.append(current_chunk)
            current_chunk = word
    if current_chunk:
        chunks.append(current_chunk)
    return chunks


def translate(text):
    sign_mt_api = (
        "https://us-central1-sign-mt.cloudfunctions.net/spoken_text_to_signed_pose"
    )
    chunks = chunk_text(text)
    video_files = []
    for i, chunk in enumerate(chunks, start=1):
        params = {"text": chunk, "spoken": "en", "signed": "ase"}
        response = requests.get(sign_mt_api, params=params)
        if response.status_code == 200:
            pose = Pose.read(response.content)
            visualized_pose = PoseVisualizer(pose)
            file_name = f"translation{i}.mp4"
            visualized_pose.save_video(file_name, visualized_pose.draw((0, 0, 0)))
            video_files.append(file_name)
    return video_files
