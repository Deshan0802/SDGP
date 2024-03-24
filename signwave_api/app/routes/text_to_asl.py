__author__ = "Romayle"
__version__ = "0.0.1"
__maintainer__ = "Romayle"
__credits__ = "AmitMY"

from flask import Blueprint, request, send_file
from pose_format import Pose
from pose_format.pose_visualizer import PoseVisualizer
import requests

previous = ""
text_to_asl_bp = Blueprint("text-to-asl", __name__)


def textToASLVideo(inputText):
    """
    Returns the video file name
            Parameters:
                    input (int): the string of text to convert to ASL to text

            Returns:
                    video (str): file name of video which is created
    """

    print("------------ Text to translate to ASL : " + inputText)
    apiForTextForASL = f"https://us-central1-sign-mt.cloudfunctions.net/spoken_text_to_signed_pose?text={inputText}&spoken=en&signed=ase"
    response = ""
    global previous
    if previous != inputText:
        print("-----------------First call --------------")
        response = requests.get(apiForTextForASL)
        if response.status_code == 200:
            previous = inputText
            # read pose file
            pose = Pose.read(response.content)
            v = PoseVisualizer(pose)
            v.save_video("translation.mp4", v.draw((0, 0, 0)))
        else:
            print(f"Error in Get Requests Error Code :{response.status_code}")
    else:
        print("-----------serve created vid on repeated requests---------")

    return "translation.mp4"


@text_to_asl_bp.route("/textToASL", methods=["GET"])
def textToASL():
    """
    Endpoint to call to translate text to ASL and get video
    """
    print("---------- START: text to ASL--------")
    inputText = request.args.get("inputText")
    print("------------ Text parameter in Request : " + inputText)
    video = textToASLVideo(inputText)
    print("---------- END: text to ASL----------")
    return send_file("../../translation.mp4")
