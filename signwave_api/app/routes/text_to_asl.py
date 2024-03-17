__author__ = "Romayle"
__version__ = "0.0.1"
__maintainer__ = "Romayle"
__credits__ = "AmitMY"

from flask import Flask, Blueprint, request, Response, send_file
from pose_format import Pose
from pose_format.pose_visualizer import PoseVisualizer
import requests
import cv2

text_to_asl_bp = Blueprint("text-to-asl", __name__)


# @text_to_asl_bp.route("/text-to-asl", methods=["POST"])
# def textToAsl():
#     data = request.form
#     text = data.get('text')
#     print('Received text:', text)
#     return jsonify({'message': 'Text received', 'text': text})

@text_to_asl_bp.route("/textToASL", methods=['GET'])
def textToASL():
    inputText = request.args.get('inputText')
    apiForTextForASL = f"https://us-central1-sign-mt.cloudfunctions.net/spoken_text_to_signed_pose?text={inputText}&spoken=en&signed=ase"
    print("inputText : " + inputText)
    
    response = requests.get(apiForTextForASL)
    
    if(response.status_code == 200):
        # read pose file  
        pose = Pose.read(response.content)
        v = PoseVisualizer(pose)
        v.save_video(vid_name, v.draw())
        return send_file(vid_name)    
    else:
        print(f"Error in Get Requests Error Code :{response.status_code}") 
