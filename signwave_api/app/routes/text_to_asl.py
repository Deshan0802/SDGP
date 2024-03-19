__author__ = "Romayle"
__version__ = "0.0.1"
__maintainer__ = "Romayle"
__credits__ = "AmitMY"

from flask import Flask, Blueprint, request, Response, send_file
from pose_format import Pose
from pose_format.pose_visualizer import PoseVisualizer
import requests
import cv2

previous = ''
text_to_asl_bp = Blueprint("text-to-asl", __name__)


# @text_to_asl_bp.route("/text-to-asl", methods=["POST"])
# def textToAsl():
#     data = request.form
#     text = data.get('text')
#     print('Received text:', text)
#     return jsonify({'message': 'Text received', 'text': text})



def textToASLVideo(inputText):
    '''
    Returns the video file name
            Parameters:
                    input (int): the string of text to convert to ASL to text

            Returns:
                    video (str): file name of video which is created 
    '''
    
    print('------------ Text to translate to ASL : ' + inputText)
    apiForTextForASL = f"https://us-central1-sign-mt.cloudfunctions.net/spoken_text_to_signed_pose?text={inputText}&spoken=en&signed=ase"
    response = ''
    global previous
    if(previous != inputText):
        print("-----------------First call --------------")
        response = requests.get(apiForTextForASL) 
        if (response.status_code == 200):
            previous = inputText
            # read pose file  
            pose = Pose.read(response.content)
            v = PoseVisualizer(pose)
            v.save_video(vid_name, v.draw()) 
        else:
            print(f"Error in Get Requests Error Code :{response.status_code}")
    else:
        print("-----------serve created vid on repeated requests---------")
        
    return vid_name
         

@text_to_asl_bp.route("/textToASL", methods=['GET'])
def textToASL():
    '''
        Endpoint to call to translate text to ASL and get video
    '''
    print("---------- START: text to ASL--------")
    inputText = request.args.get('inputText')
    print('------------ Text parameter in Request : ' + inputText)
    video = textToASLVideo(inputText)
    print("---------- END: text to ASL----------")
    return send_file(video) 
    