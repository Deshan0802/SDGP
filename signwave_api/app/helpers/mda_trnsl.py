import requests
from pose_format import Pose
from pose_format.pose_visualizer import PoseVisualizer


def translate(text):
    sign_mt_api = (
        "https://us-central1-sign-mt.cloudfunctions.net/spoken_text_to_signed_pose"
    )
    params = {"text": text, "spoken": "en", "signed": "ase"}
    response = requests.get(sign_mt_api, params=params)
    if response.status_code == 200:
        pose = Pose.read(response.content)
        visualized_pose = PoseVisualizer(pose)
        file_name = "translation.mp4"
        visualized_pose.save_video(file_name, visualized_pose.draw((0, 0, 0)))
        return file_name
