__author__ = "Romayle"
__version__ = "0.0.1"
__maintainer__ = "Romayle"
__credits__ = "AmitMY"

from flask import Flask, Blueprint, jsonify, request, Response, send_file
from pose_format import Pose
from pose_format.pose_visualizer import PoseVisualizer
import requests
import cv2

vid_name = "translation.mp4"
# vid_save_path = "./assets/textToASL/video.mp4"
is_processing = False
previous = ""
text_to_asl_bp = Blueprint("text-to-asl", __name__)
has_processed = False


# @text_to_asl_bp.route("/text-to-asl", methods=["POST"])
# def textToAsl():
#     data = request.form
#     text = data.get('text')
#     print('Received text:', text)
#     return jsonify({'message': 'Text received', 'text': text})


# def textToASLVideo(inputText):
#     '''
#     Returns the video file name
#             Parameters:
#                     input (int): the string of text to convert to ASL to text

#             Returns:
#                     video (str): file name of video which is created
#     '''

#     print('------------ Text to translate to ASL : ' + inputText)
#     apiForTextForASL = f"https://us-central1-sign-mt.cloudfunctions.net/spoken_text_to_signed_pose?text={inputText}&spoken=en&signed=ase"
#     response = ''
#     global previous
#     if(previous != inputText):
#         print("-----------------First call --------------")
#         response = requests.post(apiForTextForASL)
#         if (response.status_code == 200):
#             previous = inputText
#             # read pose file
#             pose = Pose.read(response.content)
#             v = PoseVisualizer(pose)
#             v.save_video(vid_save_path, v.draw())
#         else:
#             print(f"Error in Get Requests Error Code :{response.status_code}")
#     else:
#         print("-----------serve created vid on repeated requests---------")

#     return "../assets/textToASL/" + vid_name


# @text_to_asl_bp.route("/textToASL", methods=['GET'])
# def textToASL():
#     '''
#         Endpoint to call to translate text to ASL and get video
#     '''
#     print("---------- START: text to ASL--------")
#     inputText = request.args.get('inputText')
#     print('------------ Text parameter in Request : ' + inputText)
#     video = textToASLVideo(inputText)
#     print("---------- END: text to ASL----------")
#     return send_file(video)


def textToASLVideo(inputText):
    """
    Returns the video file name
    Parameters:
        inputText (str): the string of text to convert to ASL
    Returns:
        video (str): file name of video which is created
        error_message (str): error message if an error occurred
    """
    print("------------ Text to translate to ASL : " + inputText)
    apiForTextForASL = f"https://us-central1-sign-mt.cloudfunctions.net/spoken_text_to_signed_pose?text={inputText}&spoken=en&signed=ase"
    response = ""
    global previous
    error_message = None
    global is_processing, has_processed

    if previous != inputText and not has_processed:
        print("-----------------First call --------------")
        response = requests.post(apiForTextForASL)
        if response.status_code == 200:
            has_processed = False
            previous = inputText
            # read pose file
            pose = Pose.read(response.content)
            v = PoseVisualizer(pose)
            try:
                v.save_video(vid_name, v.draw((0, 0, 0)))
                has_processed = True
            except Exception as e:
                error_message = str(e)
        else:
            error_message = f"Error in Get Requests Error Code :{response.status_code}"
    else:
        print("-----------serve created vid on repeated requests---------")

    if error_message:
        return None, error_message
    else:
        return "OK", None


@text_to_asl_bp.route("/textToASL", methods=["GET"])
def textToASL():
    """
    Endpoint to call to translate text to ASL and get video
    """
    global has_processed
    print("---------- START: text to ASL--------")
    inputText = request.args.get("inputText")
    print("------------ Text parameter in Request : " + inputText)
    video, error_message = textToASLVideo(inputText)
    print("---------- END: text to ASL----------")

    if error_message:
        return jsonify({"error": error_message}), 500
    elif video:
        # return send_file(video)
        has_processed = False
        return jsonify({"video": vid_name})
    else:
        return jsonify({"error": "No video generated"}), 500


@text_to_asl_bp.route("/getASLVideo", methods=["GET"])
def getASLVideo():
    print("---------- START: GET ASL Video--------")
    video_name = request.args.get("videoName")
    print("------------ Text parameter in Request : " + video_name)
    print("---------- END: GET ASL Video----------")
    return send_file("../../" + vid_name)
