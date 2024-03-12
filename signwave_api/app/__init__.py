from flask import Flask
from config import Config
from app.models import db


def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)
    db.init_app(app)

    from app.routes.sign_up import sign_up_bp
    from app.routes.login import login_bp
    from app.routes.text_to_asl import text_to_asl_bp
    from app.routes.audio_to_asl import audio_to_asl_bp
    from app.routes.video_to_asl import video_to_asl_bp
    from app.routes.document_to_asl import document_to_asl_bp

    app.register_blueprint(sign_up_bp)
    app.register_blueprint(login_bp)
    app.register_blueprint(text_to_asl_bp)
    app.register_blueprint(audio_to_asl_bp)
    app.register_blueprint(video_to_asl_bp)
    app.register_blueprint(document_to_asl_bp)

    return app
